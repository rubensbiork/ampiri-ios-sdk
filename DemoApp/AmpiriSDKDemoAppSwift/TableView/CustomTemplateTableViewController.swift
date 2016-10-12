//
// Created by Glispa GmbH on 12.08.16.
// Copyright (c) 2016 Glispa GmbH All rights reserved.
//

import Foundation
import AmpiriSDK

@objc(CustomTemplateTableViewController)
class CustomTemplateTableViewController: BaseTableViewController {

    fileprivate var adapter: AMPTableViewStreamAdapter?


    override func loadClicked(_ sender: UIButton) {
        self.loadButton.isEnabled = false
        self.adapter = AmpiriSDK.shared().addLocationControl(to: tableView,
                                                             parentViewController: self,
                                                             adUnitId: "7f900c7d-7ce3-4190-8e93-310053e70ca2",
                                                             adViewClassForRendering: NativeBannerView.self)
    }
}
