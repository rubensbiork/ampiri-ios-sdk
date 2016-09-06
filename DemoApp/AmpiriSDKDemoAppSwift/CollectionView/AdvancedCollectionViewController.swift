//
//  AdvancedCollectionViewController.swift
//  AmpiriSDKTestApp
//
//  Created by Viacheslav Leonov on 16.08.16.
//  Copyright © 2016 glispa.com. All rights reserved.
//

import UIKit
import AmpiriSDK

@objc(AdvancedCollectionViewController)
class AdvancedCollectionViewController: BaseFlowLayoutCollectionViewController {
    private var adapter: AMPCollectionViewStreamAdapter?
    private var itemsCount: UInt = 0

    @IBAction func loadAdsClicked(sender: UIButton) {
        self.loadButton.enabled = false

        self.adapter = AmpiriSDK.sharedSDK().addLocationControlToCollectionView(self.collectionView, parentViewController: self, adUnitId: "7f900c7d-7ce3-4190-8e93-310053e70ca2", templateType: .ContentStream, templateCustomization: nil)
    }

    @IBAction func loadDataClicked(sender: UIButton) {
        self.dataSource = loadData(16, from: 1)
        itemsCount = 16;
        self.collectionView.amp_reloadData()
    }


    @IBAction func loadMoreDataClicked(sender: UIButton) {
        self.dataSource.appendContentsOf(loadData(8, from: itemsCount + 1))
        itemsCount += 8
        self.collectionView.amp_reloadData()
    }


    @IBAction func loadMoreSectionsClicked(sender: UIButton) {
        let addedSections = loadData(8, from: itemsCount + 1)
        itemsCount += 8
        let startIndex = 0
        self.dataSource.insertContentsOf(addedSections, at: startIndex)
        self.collectionView.amp_insertSections(NSIndexSet.init(indexesInRange: NSMakeRange(startIndex, addedSections.count)))
    }


    @IBAction func loadMoreRowsClicked(sender: UIButton) {
        if self.dataSource.count <= 0 {
            return
        }
        let addedRows = AMPDataUnitManager.createDataUnitList(8, from: itemsCount + 1)
        itemsCount += 8
        let sectionIndex = 0
        let howFarFromTheEnd = 2
        var startItemIndex = self.dataSource[sectionIndex].count - howFarFromTheEnd
        startItemIndex = startItemIndex < 0 ? 0 : startItemIndex
        var indexPaths = [NSIndexPath]()
        for itemIndex in 0 ..< addedRows.count {
            indexPaths.append(NSIndexPath(forItem: itemIndex + startItemIndex, inSection: sectionIndex))
        }
        self.dataSource[sectionIndex].insertContentsOf(addedRows, at: startItemIndex)
        self.collectionView.amp_insertItemsAtIndexPaths(indexPaths)

    }
}
