//
// Created by Viacheslav Leonov on 12.08.16.
// Copyright (c) 2016 glispa.com. All rights reserved.
//

import Foundation
import AmpiriSDK

@objc(InfeedTableViewController)
class InfeedTableViewController: BaseTableViewController {

    private var adapter: AMPTableViewStreamAdapter?


    override func loadClicked(sender: UIButton) {
        self.loadButton.enabled = false

        self.adapter = AmpiriSDK.sharedSDK().addLocationControlToTableView(tableView,
                parentViewController: self,
                adUnitId: "7f900c7d-7ce3-4190-8e93-310053e70ca2",
                templateType: .InFeed,
                templateCustomization: {
                    (templateCustomizationObject: AMPTemplateCustomizationObject!) in
                    templateCustomizationObject.ampCTABorderWidth = 1
                    templateCustomizationObject.ampCTACornerRadius = 5
                })
    }
}
