//
//  TableViewLocationControlAdDetailsViewController.swift
//  AmpiriSDKTestApp
//
//  Created by Ivan Afanasyev on 01/06/16.
//  Copyright © 2016 glispa.com. All rights reserved.
//

import UIKit

class TableViewLocationControlAdDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var templateSwitch: UISegmentedControl!
    
    private var adapter: AMPTableViewStreamAdapter?
    private var dataSource: [[AMPDataUnit]] = [[AMPDataUnit]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadButton.layer.masksToBounds = true
        self.loadButton.layer.cornerRadius = CGRectGetHeight(self.loadButton.frame) / 3
        
        loadData()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.adapter?.cancelAdsLoading()
    }
    
    @IBAction func loadClicked(sender: UIButton) {
        self.loadButton.enabled = false
        
        self.adapter = AmpiriSDK.sharedSDK().addLocationControlToTableView(tableView, parentViewController: self, identifier: "7f900c7d-7ce3-4190-8e93-310053e70ca2", templateType: self.templateSwitch.selectedSegmentIndex == 0 ? .InFeed : .ContentStream, templateCustomization: { (templateCustomizationObject: AMPTemplateCustomizationObject!) in
            templateCustomizationObject.ampCTABorderWidth = 1
            templateCustomizationObject.ampCTACornerRadius = 5
        })
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.grayColor()
        return view
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 18
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: AMPLocationControlTableViewCell = tableView.dequeueReusableCellWithIdentifier("AMPLocationControlTableViewCell") as! AMPLocationControlTableViewCell
        
        let item: AMPDataUnit = self.dataSource[indexPath.section][indexPath.row]
        
        cell.tweetNameLabel.text = item.name
        if  item.photo == nil {
            cell.tweetImageView.image = nil
            cell.tweetImageWidthConstrint.constant = 0
            cell.tweetImageHeigthConstrint.constant = 20
        } else {
            cell.tweetImageView.image = item.photo
            cell.tweetImageWidthConstrint.constant = 120
            cell.tweetImageHeigthConstrint.constant = 120
        }
        
        cell.tweetTextLabel.text = item.specification
        cell.tweetDateLabel.text = item.pinUnit
        
        cell.layoutIfNeeded()
        
        return cell
    }
    
    func loadData() {
        let units = AMPDataUnitManager.createDataUnitList() as! [AMPDataUnit]
        organizeData(units, dividedBySectionsCount: 3)
    }
    
    func organizeData(dataArray:[AMPDataUnit], dividedBySectionsCount sectionsCount: Int) {
        self.dataSource = [Array<AMPDataUnit>]()
        let itemsInSection: Int = Int(dataArray.count / sectionsCount)
        var startPos: Int = 0
        for _ in 0..<sectionsCount {
            let lastPosition = min(startPos + itemsInSection, dataArray.count)
            let itemsGroupe = Array(dataArray[startPos..<lastPosition])
            startPos += itemsGroupe.count
            self.dataSource.append(itemsGroupe)
        }
        
        if startPos < dataArray.count {
            var itemsGroupe = self.dataSource[self.dataSource.count - 1]
            itemsGroupe += dataArray[startPos..<dataArray.count]
            self.dataSource[self.dataSource.count - 1] = itemsGroupe
        }
    }
}
