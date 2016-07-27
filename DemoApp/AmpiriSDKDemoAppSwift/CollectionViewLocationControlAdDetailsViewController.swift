//
//  CollectionViewLocationControlAdDetailsViewController.swift
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 01/06/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import UIKit
import AmpiriSDK

class CollectionViewLocationControlAdDetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CollectionViewCircleLayoutTwoKindDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var templateSwitch: UISegmentedControl!
    @IBOutlet weak var layoutModeSwitch: UISwitch!

    private var flowLayout: UICollectionViewLayout?
    private var customLayout: UICollectionViewLayout?


    private var adapter: AMPCollectionViewStreamAdapter?
    private var dataSource: [AMPDataUnit] = [AMPDataUnit]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadButton.layer.masksToBounds = true
        self.loadButton.layer.cornerRadius = CGRectGetHeight(self.loadButton.frame) / 3
        self.layoutModeSwitch.on = true
        self.flowLayout = self.collectionView.collectionViewLayout
        self.collectionView.showsHorizontalScrollIndicator = false

        loadData()
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }

    @IBAction func didCustolLayoutSwitchValueChanged(sender: UIButton) {
        if (self.layoutModeSwitch.on) {
            self.applyFlowLayoutMode()
        } else {
            self.applyCustomLayoutMode()
        }
    }

    @IBAction func loadClicked(sender: UIButton) {
        self.loadButton.enabled = false
        self.layoutModeSwitch.enabled = false

        self.adapter = AmpiriSDK.sharedSDK().addLocationControlToCollectionView(self.collectionView, parentViewController: self, adUnitId: "7f900c7d-7ce3-4190-8e93-310053e70ca2", useDefaultGridMode: self.layoutModeSwitch.on, templateType: .InFeed, templateCustomization: nil)
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if self.layoutModeSwitch.on {
            return self.standardCellForCollectionView(collectionView, cellForItemAtIndexPath: indexPath, withCellIdentifier: "AMPLocationControlCollectionViewCell")
        } else {
            if (self.adapter?.shouldDisplayAdAtIndexPath(indexPath) == true) {
                return self.adCellForCollectionView(collectionView, cellForItemAtIndexPath: indexPath)
            } else {
                return self.standardCellForCollectionView(collectionView, cellForItemAtIndexPath: indexPath, withCellIdentifier: "AMPLocationControlCustomCollectionViewCell")
            }
        }
    }

    private func standardCellForCollectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath, withCellIdentifier identifier: String) -> UICollectionViewCell {

        let cell: AMPLocationControlCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! AMPLocationControlCollectionViewCell
        var actualIndexPath: NSIndexPath = indexPath

        if !self.layoutModeSwitch.on {
            actualIndexPath = self.adapter?.originalIndexPath(indexPath) ?? indexPath
        }

        let item: AMPDataUnit = self.dataSource[actualIndexPath.row]
        cell.tweetNameLabel.text = item.name
        if let imageHeightConstraint = cell.tweetImageHeightConstraint {
            if item.photo == nil {
                imageHeightConstraint.constant = 0
            } else {
                imageHeightConstraint.constant = (self.collectionView.frame.size.width - 4) / 2
            }
        }

        cell.tweetImageView.image = item.photo

        if let textLabel = cell.tweetTextLabel {
            textLabel.text = item.specification
        }

        cell.layoutIfNeeded()

        return cell
    }

    private func adCellForCollectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: AMPAdContainerCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("AMPAdContainerCollectionViewCell", forIndexPath: indexPath) as! AMPAdContainerCollectionViewCell

        cell.layer.zPosition = 100
        return (self.adapter?.adRenderedAdCellAtIndexPath(indexPath, inCell: cell))!
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if self.layoutModeSwitch.on {
            return CGSize(width: Int((collectionView.frame.size.width - 4) / 2.0), height: Int((collectionView.frame.size.width - 4) / 1.1))
        } else {
            return CGSizeZero
        }
    }

    private func applyCustomLayoutMode() {
        if (self.customLayout == nil) {
            let customLayout: CollectionViewCircleLayout = CollectionViewCircleLayout()
            customLayout.delegate = self;
            self.customLayout = customLayout;
        }
        self.collectionView.setCollectionViewLayout(self.customLayout!, animated: true) {
            (finished) in
            self.collectionView.reloadData()
        }
    }

    private func applyFlowLayoutMode() {
        self.collectionView.setCollectionViewLayout(self.flowLayout!, animated: true) {
            (finished) in
            self.customLayout = nil
            self.collectionView.reloadData()
        }
    }

    func shouldUseDefaultAttributeForItemAtIndexPath(indexPath: NSIndexPath!) -> Bool {
        return self.adapter != nil ? (self.adapter?.shouldDisplayAdAtIndexPath(indexPath))! : false
    }

    func loadData() {
        let units = AMPDataUnitManager.createDataUnitList() as! [AMPDataUnit]
        organizeData(units, dividedBySectionsCount: 3)
    }

    func organizeData(dataArray: [AMPDataUnit], dividedBySectionsCount sectionsCount: Int) {
        self.dataSource = [AMPDataUnit]() + dataArray
    }
}
