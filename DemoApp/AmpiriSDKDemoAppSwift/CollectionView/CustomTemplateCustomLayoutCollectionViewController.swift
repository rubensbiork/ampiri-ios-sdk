//
// Created by Viacheslav Leonov on 12.08.16.
// Copyright (c) 2016 glispa.com. All rights reserved.
//

import Foundation
import AmpiriSDK

@objc(CustomTemplateCustomLayoutCollectionViewController)
class CustomTemplateCustomLayoutCollectionViewController: BaseCustomLayoutCollectionViewController, AMPCollectionViewStreamAdapterDelegate {
    private var adapter: AMPCollectionViewStreamAdapter?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.registerNib(UINib.init(nibName: NSStringFromClass(AMPAdContainerCollectionViewCell), bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: NSStringFromClass(AMPAdContainerCollectionViewCell))
    }


    override func loadClicked(sender: UIButton) {
        self.loadButton.enabled = false

        self.adapter = AmpiriSDK.sharedSDK().addLocationControlToCollectionView(self.collectionView, parentViewController: self, adUnitId: "7f900c7d-7ce3-4190-8e93-310053e70ca2", useDefaultGridMode: false, delegate: self, adViewClassForRendering: NativeBannerView.self)
    }


    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if (self.adapter?.shouldDisplayAdAtIndexPath(indexPath) == true) {
            return self.adCellForCollectionView(collectionView, cellForItemAtIndexPath: indexPath)
        } else {
            return self.standardCellForCollectionView(collectionView, cellForItemAtIndexPath: indexPath, withCellIdentifier: "AMPLocationControlCustomCollectionViewCell")
        }
    }

    private func standardCellForCollectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath, withCellIdentifier identifier: String) -> UICollectionViewCell {

        let cell: AMPLocationControlCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! AMPLocationControlCollectionViewCell
        //you should use originalIndexPath method to get right indexPath from adapter
        let actualIndexPath = self.adapter?.originalIndexPath(indexPath) ?? indexPath
        let item: AMPDataUnit = self.dataSource[actualIndexPath.section][actualIndexPath.row]
        cell.tweetNameLabel.text = item.name
        if let imageHeightConstraint = cell.tweetImageHeightConstraint {
            if item.photo == nil {
                imageHeightConstraint.constant = 0
            } else {
                imageHeightConstraint.constant = (self.collectionView.frame.size.width - 4) / 2
            }
        }

        cell.tweetImageView.image = UIImage(named: item.photo);

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


    override func shouldUseDefaultAttributeForItemAtIndexPath(indexPath: NSIndexPath!) -> Bool {
        return self.adapter != nil ? self.adapter!.shouldDisplayAdAtIndexPath(indexPath) : false
    }


    func sizeForAdAtIndexPath(indexPath: NSIndexPath!) -> CGSize {
        return CGSizeMake(320, NativeBannerView.desiredHeight())
    }
}
