//
// Created by Glispa GmbH on 12.08.16.
// Copyright (c) 2016 Glispa GmbH All rights reserved.
//

import Foundation
import UIKit
import AmpiriSDK

@objc(BaseTableViewController)
class BaseTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    fileprivate var dataSource: [[AMPDataUnit]] = [[AMPDataUnit]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib.init(nibName: NSStringFromClass(AMPLocationControlTableViewCell.self), bundle: Bundle.main), forCellReuseIdentifier: NSStringFromClass(AMPLocationControlTableViewCell.self))
        loadData()
    }


    @IBAction func loadClicked(_ sender: UIButton) {
    }

    @IBAction func editClicked(_ sender: UIButton) {
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AMPLocationControlTableViewCell = tableView.dequeueReusableCell(withIdentifier: "AMPLocationControlTableViewCell") as! AMPLocationControlTableViewCell

        let item: AMPDataUnit = self.dataSource[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]

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


    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }


    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.gray
        return view
    }


    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 18
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }


    func loadData() {
        let units = AMPDataUnitManager.createDataUnitList(20)
        organizeData(units, dividedBySectionsCount: 3)
    }


    func organizeData(_ dataArray: [AMPDataUnit], dividedBySectionsCount sectionsCount: Int) {
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
