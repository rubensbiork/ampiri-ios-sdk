//
//  TableViewLocationControlAdDetailsViewController.swift
//  AmpiriSDKTestApp
//
//  Created by Ivan Afanasyev on 01/06/16.
//  Copyright © 2016 glispa.com. All rights reserved.
//

import UIKit

class TableViewLocationControlAdDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var templateSwitch: UISegmentedControl!
    
    private var adapter: AMPTableViewStreamAdapter?
    private var dataSource: [AMPTweet] = [AMPTweet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadButton.layer.masksToBounds = true
        self.loadButton.layer.cornerRadius = CGRectGetHeight(self.loadButton.frame) / 3
        
        AMPTweetsManager.sharedManager().loadNextSetOfTweets { (tweets:[AMPTweet]!, error: NSError!) in
            self.dataSource = tweets
            self.tableView.reloadData()
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.adapter?.cancelAdsLoading()
    }
    
    @IBAction func loadClicked(sender: UIButton) {
        self.loadButton.enabled = false
        
        self.adapter = AmpiriSDK.sharedSDK().addLocationControlToTableView(tableView, parentViewController: self, identifier: "00000000-0000-0000-0000-000000000008", templateType: self.templateSwitch.selectedSegmentIndex == 0 ? .InFeed : .ContentStream, templateCustomization: { (templateCustomizationObject: AMPTemplateCustomizationObject!) in
            templateCustomizationObject.ampCTABorderWidth = 1
            templateCustomizationObject.ampCTACornerRadius = 5
        })
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count / self.numberOfSectionsInTableView(tableView)
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.grayColor()
        return view
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 18
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cell: AMPLocationControlTableViewCell = tableView.dequeueReusableCellWithIdentifier("AMPLocationControlTableViewCell") as! AMPLocationControlTableViewCell
        
        let height: CGFloat = cell.amp_heightWithWidth(cell.frame.size.width) { (cellForRendering) in
            if let adCell: AMPLocationControlTableViewCell = cellForRendering as? AMPLocationControlTableViewCell {
                let actualIndexPath: NSIndexPath = self.adapter?.originalIndexPath(indexPath) ?? indexPath
                
                let tweet: AMPTweet = self.dataSource[actualIndexPath.section * self.numberOfSectionsInTableView(tableView) + actualIndexPath
                        .row]
                
                if tweet.imageURL == nil || tweet.imageURL.absoluteString.isEmpty {
                    adCell.tweetImageWidthConstrint.constant = 0
                    adCell.tweetImageHeigthConstrint.constant = 0
                } else {
                    adCell.tweetImageWidthConstrint.constant = 120
                    adCell.tweetImageHeigthConstrint.constant = 120
                }
                
                adCell.tweetDateLabel.text = tweet.date;
                adCell.tweetTextLabel.text = tweet.tweetMessage;
                
                adCell.layoutIfNeeded();

            }
        }
        
        return height
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: AMPLocationControlTableViewCell = tableView.dequeueReusableCellWithIdentifier("AMPLocationControlTableViewCell") as! AMPLocationControlTableViewCell
        let actualIndexPath: NSIndexPath = self.adapter?.originalIndexPath(indexPath) ?? indexPath
        
        let tweet: AMPTweet = self.dataSource[actualIndexPath.section * self.numberOfSectionsInTableView(tableView) + actualIndexPath
            .row]
        
        if tweet.imageURL == nil || tweet.imageURL.absoluteString.isEmpty {
            cell.tweetImageView.image = nil
            cell.tweetImageWidthConstrint.constant = 0
            cell.tweetImageHeigthConstrint.constant = 0
        } else {
            cell.tweetImageView.setImageWithURL(tweet.imageURL, delegate: nil)
            cell.tweetImageWidthConstrint.constant = 120
            cell.tweetImageHeigthConstrint.constant = 120
        }
        
        cell.tweetDateLabel.text = tweet.date;
        cell.tweetTextLabel.text = tweet.tweetMessage;
        
        cell.layoutIfNeeded();
        
        return cell
    }
}
