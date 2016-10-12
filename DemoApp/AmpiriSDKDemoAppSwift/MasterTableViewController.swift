//
//  MasterTableViewController.swift
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 19/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import UIKit

struct AdExampleItem {
    let title: String
    let controller: String?
    let xibName: String?
    let childItems: [AdExampleItem]?
}

class MasterTableViewController: UITableViewController {

    fileprivate var adItems: [AdExampleItem] = [
            AdExampleItem(title: "BANNERS", controller: "BannersDetailViewController", xibName: nil, childItems: nil),
            AdExampleItem(title: "INTERSTITIALS", controller: "FullscreensDetailViewController", xibName: nil, childItems: nil),
            AdExampleItem(title: "VIDEOS", controller: "VideoDetailViewController", xibName: nil, childItems: nil),
            AdExampleItem(title: "NATIVE", controller: "NativeAdDetailsViewController", xibName: nil, childItems: nil),
            AdExampleItem(title: "LOCATION CONTROL", controller: nil, xibName: nil, childItems:
            [AdExampleItem(title: "UITableView Examples", controller: nil, xibName: nil, childItems: [
                    AdExampleItem(title: "Infeed", controller: "InfeedTableViewController", xibName: "BaseTableViewController", childItems: nil),
                    AdExampleItem(title: "Content stream", controller: "ContentStreamTableViewController", xibName: "BaseTableViewController", childItems: nil),
                    AdExampleItem(title: "Custom view", controller: "CustomTemplateTableViewController", xibName: "BaseTableViewController", childItems: nil)
            ]),
             AdExampleItem(title: "UICollectionView Examples", controller: nil, xibName: nil, childItems: [
                     AdExampleItem(title: "Flow layout", controller: nil, xibName: nil, childItems: [
                             AdExampleItem(title: "Infeed", controller: "InfeedFlowLayoutCollectionViewController", xibName: "BaseCollectionViewController", childItems: nil),
                             AdExampleItem(title: "Content stream", controller: "ContentStreamFlowLayoutCollectionViewController", xibName: "BaseCollectionViewController", childItems: nil),
                             AdExampleItem(title: "Custom view", controller: "CustomTemplateFlowLayoutCollectionViewController", xibName: "BaseCollectionViewController", childItems: nil),
                             AdExampleItem(title: "Dynamic data source", controller: "AdvancedCollectionViewController", xibName: "AdvancedCollectionViewController", childItems: nil)
                     ]),
                     AdExampleItem(title: "Custom template", controller: "CustomTemplateCustomLayoutCollectionViewController", xibName: "BaseCollectionViewController", childItems: nil)
             ])
            ])
    ]

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.adItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = self.adItems[(indexPath as NSIndexPath).row].title

        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let item = self.adItems[(indexPath as NSIndexPath).row]
        if let xibName = item.xibName, let controllerName = item.controller {
            let viewControllerClass = NSClassFromString(controllerName) as! UIViewController.Type
            let viewController = viewControllerClass.init(nibName: xibName, bundle: Bundle.main)
            self.navigationController?.showDetailViewController(viewController, sender: nil)
        } else if let controllerName = item.controller {
            self.splitViewController?.showDetailViewController(storyboard.instantiateViewController(withIdentifier: controllerName), sender: nil)
        } else if let adItems = item.childItems {
            let viewController = storyboard.instantiateViewController(withIdentifier: "MasterTableViewController") as! MasterTableViewController
            viewController.adItems = adItems
            viewController.title = item.title
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
