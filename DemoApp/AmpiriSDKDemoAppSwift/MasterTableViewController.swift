//
//  MasterTableViewController.swift
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 19/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {

    private let items = ["BANNERS", "INTERSTITIALS", "VIDEOS", "NATIVE", "LOCATION CONTROL"]

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        cell.textLabel?.text = self.items[indexPath.row]

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        switch indexPath.row {
        case 0:
            self.splitViewController?.showDetailViewController(storyboard.instantiateViewControllerWithIdentifier("BannersDetailViewController"), sender: nil)

        case 1:
            self.splitViewController?.showDetailViewController(storyboard.instantiateViewControllerWithIdentifier("FullscreensDetailViewController"), sender: nil)

        case 2:
            self.splitViewController?.showDetailViewController(storyboard.instantiateViewControllerWithIdentifier("VideoDetailViewController"), sender: nil)

        case 3:
            self.splitViewController?.showDetailViewController(storyboard.instantiateViewControllerWithIdentifier("NativeAdDetailsViewController"), sender: nil)

        case 4:
            let tabBarController: UITabBarController = UITabBarController()
            tabBarController.viewControllers = [storyboard.instantiateViewControllerWithIdentifier("TableViewLocationControlAdDetailsViewController"), storyboard.instantiateViewControllerWithIdentifier("CollectionViewLocationControlAdDetailsViewController")];

            tabBarController.tabBar.items![0].title = "Table"
            tabBarController.tabBar.items![1].title = "Collection"

            self.splitViewController?.showDetailViewController(tabBarController, sender: nil)

        default:
            break;
        }
    }
}
