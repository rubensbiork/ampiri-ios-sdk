//
//  AdvancedCollectionViewController.swift
//  AmpiriSDKTestApp
//
//  Created by Glispa GmbH on 16.08.16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

import UIKit
import AmpiriSDK

@objc(AdvancedCollectionViewController)
class AdvancedCollectionViewController: BaseFlowLayoutCollectionViewController, AMPCollectionViewStreamAdapterDelegate {
    fileprivate var adapter: AMPCollectionViewStreamAdapter?
    fileprivate var itemsCount: UInt = 0

    @IBAction func loadAdsClicked(_ sender: UIButton) {
        self.loadButton.isEnabled = false

        self.adapter = AmpiriSDK.shared().addLocationControl(to: self.collectionView,
                                                             parentViewController: self,
                                                             adUnitId: "7f900c7d-7ce3-4190-8e93-310053e70ca2",
                                                             templateType: .contentStream,
                                                             delegate: self,
                                                             templateCustomization: nil)
        
    }

    @IBAction func loadDataClicked(_ sender: UIButton) {
        self.dataSource = loadData(16, from: 1)
        itemsCount = 16;
        self.collectionView.amp_reloadData()
    }


    @IBAction func loadMoreDataClicked(_ sender: UIButton) {
        self.dataSource.append(contentsOf: loadData(8, from: itemsCount + 1))
        itemsCount += 8
        self.collectionView.amp_reloadData()
    }


    @IBAction func loadMoreSectionsClicked(_ sender: UIButton) {
        let addedSections = loadData(8, from: itemsCount + 1)
        itemsCount += 8
        let startIndex = 0
        self.dataSource.insert(contentsOf: addedSections, at: startIndex)
        self.collectionView.amp_insertSections(IndexSet.init(integersIn: NSMakeRange(startIndex, addedSections.count).toRange() ?? 0..<0))
    }


    @IBAction func loadMoreRowsClicked(_ sender: UIButton) {
        if self.dataSource.count <= 0 {
            return
        }
        let addedRows = AMPDataUnitManager.createDataUnitList(8, from: itemsCount + 1)
        itemsCount += 8
        let sectionIndex = 0
        let howFarFromTheEnd = 2
        var startItemIndex = self.dataSource[sectionIndex].count - howFarFromTheEnd
        startItemIndex = startItemIndex < 0 ? 0 : startItemIndex
        var indexPaths = [IndexPath]()
        for itemIndex in 0 ..< addedRows.count {
            indexPaths.append(IndexPath(item: itemIndex + startItemIndex, section: sectionIndex))
        }
        self.dataSource[sectionIndex].insert(contentsOf: addedRows, at: startItemIndex)
        self.collectionView.amp_insertItems(atIndexPaths: indexPaths)

    }
    
    // * Optional protocol
    // If you create an AMPCollectionViewStreamAdapter instance on the base of predefined ad templates then support of anAMPCollectionViewStreamAdapterDelegate protocol is not required because each template has an optimal size. However if you conform this protocol, you can change these predefined values.
    func sizeForAd(at indexPath: IndexPath!) -> CGSize {
        return CGSize(width: 320, height: 320)
    }
}
