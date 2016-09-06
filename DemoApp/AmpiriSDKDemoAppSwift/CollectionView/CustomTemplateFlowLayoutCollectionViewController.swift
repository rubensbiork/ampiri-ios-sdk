//
// Created by Viacheslav Leonov on 12.08.16.
// Copyright (c) 2016 glispa.com. All rights reserved.
//

import Foundation
import AmpiriSDK

@objc(CustomTemplateFlowLayoutCollectionViewController)
class CustomTemplateFlowLayoutCollectionViewController: BaseFlowLayoutCollectionViewController, AMPCollectionViewStreamAdapterDelegate {
    private var adapter: AMPCollectionViewStreamAdapter?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = loadData(20, from: 0)
    }

    override func loadClicked(sender: UIButton) {
        self.loadButton.enabled = false

        self.adapter = AmpiriSDK.sharedSDK().addLocationControlToCollectionView(self.collectionView, parentViewController: self, adUnitId: "7f900c7d-7ce3-4190-8e93-310053e70ca2", useDefaultGridMode: true, delegate: self, adViewClassForRendering: NativeBannerView.self)
    }

    func sizeForAdAtIndexPath(indexPath: NSIndexPath!) -> CGSize {
        return CGSizeMake(320, NativeBannerView.desiredHeight())
    }
}
