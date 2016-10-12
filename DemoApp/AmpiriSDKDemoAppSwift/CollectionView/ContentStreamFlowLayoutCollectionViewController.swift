//
// Created by Glispa GmbH on 12.08.16.
// Copyright (c) 2016 Glispa GmbH All rights reserved.
//

import Foundation
import AmpiriSDK

@objc(ContentStreamFlowLayoutCollectionViewController)
class ContentStreamFlowLayoutCollectionViewController: BaseFlowLayoutCollectionViewController {
    fileprivate var adapter: AMPCollectionViewStreamAdapter?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = loadData(20, from: 0)
    }

    override func loadClicked(_ sender: UIButton) {
        self.loadButton.isEnabled = false

        self.adapter = AmpiriSDK.shared().addLocationControl(to: self.collectionView,
                                                             parentViewController: self,
                                                             adUnitId: "7f900c7d-7ce3-4190-8e93-310053e70ca2",
                                                             templateType: .contentStream,
                                                             delegate: nil,
                                                             templateCustomization: nil)
    }
}
