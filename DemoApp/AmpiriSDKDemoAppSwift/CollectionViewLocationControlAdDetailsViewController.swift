//
//  CollectionViewLocationControlAdDetailsViewController.swift
//  AmpiriSDKTestApp
//
//  Created by Ivan Afanasyev on 01/06/16.
//  Copyright © 2016 glispa.com. All rights reserved.
//

import UIKit

class CollectionViewLocationControlAdDetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CollectionViewCircleLayoutTwoKindDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var templateSwitch: UISegmentedControl!
    @IBOutlet weak var layoutModeSwitch: UISwitch!
    
    private var flowLayout: UICollectionViewLayout?
    private var customLayout: UICollectionViewLayout?
    
    
    private var adapter: AMPCollectionViewStreamAdapter?
    private var dataSource: [AMPTweet] = [AMPTweet]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadButton.layer.masksToBounds = true
        self.loadButton.layer.cornerRadius = CGRectGetHeight(self.loadButton.frame) / 3
        self.layoutModeSwitch.on = true
        self.flowLayout = self.collectionView.collectionViewLayout
        self.collectionView.showsHorizontalScrollIndicator = false
        
        AMPTweetsManager.sharedManager().loadNextSetOfTweets { (tweets:[AMPTweet]!, error: NSError!) in
            self.dataSource = tweets
            self.collectionView.reloadData()
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.adapter?.cancelAdsLoading()
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
        
        self.adapter = AmpiriSDK.sharedSDK().addLocationControlToCollectionView(self.collectionView, parentViewController: self, identifier: "00000000-0000-0000-0000-000000000008", useDefaultGridMode: self.layoutModeSwitch.on, templateType: .InFeed, templateCustomization: nil)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if self.layoutModeSwitch.on {
            return self.standardCellForCollectionView(collectionView, cellForItemAtIndexPath: indexPath, withCellIdentifier:"AMPLocationControlCollectionViewCell")
        } else {
            if (self.adapter?.shouldDisplayAdAtIndexPath(indexPath) == true) {
                return self.adCellForCollectionView(collectionView, cellForItemAtIndexPath: indexPath)
            } else {
                return self.standardCellForCollectionView(collectionView, cellForItemAtIndexPath: indexPath, withCellIdentifier:"AMPLocationControlCustomCollectionViewCell")
            }
        }
    }
    
    private func standardCellForCollectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath, withCellIdentifier identifier: String) -> UICollectionViewCell {
        
        let cell: AMPLocationControlCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! AMPLocationControlCollectionViewCell
        let actualIndexPath: NSIndexPath = self.adapter?.originalIndexPath(indexPath) ?? indexPath
        
        let tweet: AMPTweet = self.dataSource[actualIndexPath.row]
        
        if let imageHeightConstraint = cell.tweetImageHeightConstraint {
            if tweet.imageURL == nil || tweet.imageURL.absoluteString.isEmpty {
                imageHeightConstraint.constant = 0
                cell.tweetImageView.image = nil
            } else {
                cell.tweetImageView.setImageWithURL(tweet.imageURL, delegate: nil)
                imageHeightConstraint.constant = (self.collectionView.frame.size.width - 4) / 2
            }
        }
        
        cell.tweetDateLabel.text = tweet.date
        
        if let textLabel = cell.tweetTextLabel {
            textLabel.text = tweet.tweetMessage
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
            return collectionView.amp_sizeForCellWithIdentifier("AMPLocationControlCollectionViewCell", indexPath: indexPath, fixedWidth: (self.collectionView.frame.size.width - 4) / 2, configuration: { (collectionCell) in
                if let cell: AMPLocationControlCollectionViewCell = collectionCell as? AMPLocationControlCollectionViewCell {
                    let actualIndexPath: NSIndexPath = self.adapter?.originalIndexPath(indexPath) ?? indexPath
                    
                    let tweet: AMPTweet = self.dataSource[actualIndexPath.row]
                    
                    if let imageHeightConstraint = cell.tweetImageHeightConstraint {
                        if tweet.imageURL == nil || tweet.imageURL.absoluteString.isEmpty {
                            imageHeightConstraint.constant = 0
                            cell.tweetImageView.image = nil
                        } else {
                            cell.tweetImageView.setImageWithURL(tweet.imageURL, delegate: nil)
                            imageHeightConstraint.constant = (self.collectionView.frame.size.width - 4) / 2
                        }
                    }
                    
                    cell.tweetDateLabel.text = tweet.date
                    cell.tweetTextLabel.text = tweet.tweetMessage
                    
                    cell.layoutIfNeeded()
                }
            })
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
        self.collectionView.setCollectionViewLayout(self.customLayout!, animated: true) { (finished) in
            self.collectionView.reloadData()
        }
    }
    
    private func applyFlowLayoutMode() {
        self.collectionView.setCollectionViewLayout(self.flowLayout!, animated: true) { (finished) in
            self.customLayout = nil
            self.collectionView.reloadData()
        }
    }
    
    func shouldUseDefaultAttributeForItemAtIndexPath(indexPath: NSIndexPath!) -> Bool {
        return self.adapter != nil ? (self.adapter?.shouldDisplayAdAtIndexPath(indexPath))! : false
    }
}
