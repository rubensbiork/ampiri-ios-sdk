//
// Created by Viacheslav Leonov on 12.08.16.
// Copyright (c) 2016 glispa.com. All rights reserved.
//

import Foundation
import UIKit
import AmpiriSDK

@objc(BaseTableViewController)
class BaseTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    private var dataSource: [[AMPDataUnit]] = [[AMPDataUnit]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerNib(UINib.init(nibName: NSStringFromClass(AMPLocationControlTableViewCell), bundle: NSBundle.mainBundle()), forCellReuseIdentifier: NSStringFromClass(AMPLocationControlTableViewCell))
        loadData()
    }


    @IBAction func loadClicked(sender: UIButton) {
    }

    @IBAction func editClicked(sender: UIButton) {
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: AMPLocationControlTableViewCell = tableView.dequeueReusableCellWithIdentifier("AMPLocationControlTableViewCell") as! AMPLocationControlTableViewCell

        let item: AMPDataUnit = self.dataSource[indexPath.section][indexPath.row]

        cell.tweetNameLabel.text = item.name
        if item.photo == nil {
            cell.tweetImageView.image = nil
        } else {
            cell.tweetImageView.image = UIImage(named: item.photo)
        }

        cell.tweetTextLabel.text = item.specification

        cell.layoutIfNeeded()

        return cell
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


    func loadData() {
        let units = AMPDataUnitManager.createDataUnitList(20)
        organizeData(units, dividedBySectionsCount: 3)
    }


    func organizeData(dataArray: [AMPDataUnit], dividedBySectionsCount sectionsCount: Int) {
        self.dataSource = [Array < AMPDataUnit>]()
        let itemsInSection: Int = Int(dataArray.count / sectionsCount)
        var startPos: Int = 0
        for _ in 0 ..< sectionsCount {
            let lastPosition = min(startPos + itemsInSection, dataArray.count)
            let itemsGroupe = Array(dataArray[startPos ..< lastPosition])
            startPos += itemsGroupe.count
            self.dataSource.append(itemsGroupe)
        }

        if startPos < dataArray.count {
            var itemsGroupe = self.dataSource[self.dataSource.count - 1]
            itemsGroupe += dataArray[startPos ..< dataArray.count]
            self.dataSource[self.dataSource.count - 1] = itemsGroupe
        }
    }
}
