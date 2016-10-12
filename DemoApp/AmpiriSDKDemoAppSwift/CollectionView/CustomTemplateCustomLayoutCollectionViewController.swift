//
// Created by Glispa GmbH on 12.08.16.
// Copyright (c) 2016 Glispa GmbH All rights reserved.
//

import Foundation
import AmpiriSDK

@objc(CustomTemplateCustomLayoutCollectionViewController)
class CustomTemplateCustomLayoutCollectionViewController: BaseCustomLayoutCollectionViewController, AMPCollectionViewStreamAdapterDelegate {
    fileprivate var adapter: AMPCollectionViewStreamAdapter?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib.init(nibName: NSStringFromClass(AMPAdContainerCollectionViewCell.self), bundle: Bundle.main), forCellWithReuseIdentifier: NSStringFromClass(AMPAdContainerCollectionViewCell.self))
    }


    override func loadClicked(_ sender: UIButton) {
        self.loadButton.isEnabled = false

        self.adapter = AmpiriSDK.shared().addLocationControl(to: self.collectionView,
                                                             parentViewController: self,
                                                             adUnitId: "7f900c7d-7ce3-4190-8e93-310053e70ca2",
                                                             useDefaultGridMode: false,
                                                             delegate: self,
                                                             adViewClassForRendering: NativeBannerView.self)
    }


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (self.adapter?.shouldDisplayAd(at: indexPath) == true) {
            return self.adCellForCollectionView(collectionView, cellForItemAtIndexPath: indexPath)
        } else {
            return self.standardCellForCollectionView(collectionView, cellForItemAtIndexPath: indexPath, withCellIdentifier: "AMPLocationControlCustomCollectionViewCell")
        }
    }

    fileprivate func standardCellForCollectionView(_ collectionView: UICollectionView, cellForItemAtIndexPath indexPath: IndexPath, withCellIdentifier identifier: String) -> UICollectionViewCell {

        let cell: AMPLocationControlCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! AMPLocationControlCollectionViewCell
        //you should use originalIndexPath method to get right indexPath from adapter
        let actualIndexPath = self.adapter?.originalIndexPath(indexPath) ?? indexPath
        let item: AMPDataUnit = self.dataSource[(actualIndexPath as NSIndexPath).section][(actualIndexPath as NSIndexPath).row]
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

    fileprivate func adCellForCollectionView(_ collectionView: UICollectionView, cellForItemAtIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AMPAdContainerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AMPAdContainerCollectionViewCell", for: indexPath) as! AMPAdContainerCollectionViewCell

        cell.layer.zPosition = 100
        return (self.adapter?.adRenderedAdCell(at: indexPath, in: cell))!
    }


    override func shouldUseDefaultAttributeForItem(at indexPath: IndexPath!) -> Bool {
        return self.adapter != nil ? self.adapter!.shouldDisplayAd(at: indexPath) : false
    }


    func sizeForAd(at indexPath: IndexPath!) -> CGSize {
        return CGSize(width: 320, height: NativeBannerView.desiredHeight())
    }
}
