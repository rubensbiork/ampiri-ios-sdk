//
//  BannersDetailViewController.swift
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 19/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import UIKit

class BannersDetailViewController: UIViewController {

    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var hideButton: UIButton!
    
    @IBOutlet weak var sizeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var autoupdateSwitch: UISwitch!
    
    private var bannerView: AMPBannerView?
    private var bannerSize: CGSize?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showButton.layer.masksToBounds = true
        self.hideButton.layer.masksToBounds = true
        
        self.showButton.layer.cornerRadius = CGRectGetHeight(self.showButton.frame) / 3
        self.hideButton.layer.cornerRadius = CGRectGetHeight(self.hideButton.frame) / 3
        
        self.sizeClicked(self.sizeSegmentedControl)
    }
    
    
    @IBAction func showClicked(sender: UIButton) {
        if self.bannerView != nil {
            self.bannerView?.stop()
            self.bannerView?.removeFromSuperview()
            self.bannerView = nil
        }
        
        self.bannerView = AmpiriSDK.sharedSDK().loadBannerWithSize(self.bannerSize!, identifier: "04c447d7-ffb8-4ba1-985e-4d2b9f88cd69", success: nil, failure: nil)
        
        self.view.addSubview(self.bannerView!)
        
        self.bannerView?.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[bannerView(\(self.bannerSize!.height))]-20-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["bannerView" : self.bannerView!]))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[bannerView(\(self.bannerSize!.width))]", options: .AlignAllCenterX, metrics: nil, views: ["bannerView" : self.bannerView!]))
    }
    
    @IBAction func hideClicked(sender: UIButton) {
        if self.bannerView != nil {
            self.bannerView?.stop()
            self.bannerView?.removeFromSuperview()
            self.bannerView = nil
        }
    }

    @IBAction func autoupdateSwitched(sender: UISwitch) {
        if (self.bannerView != nil) {
            self.bannerView!.autoUpdate = sender.on
        }
    }
    
    @IBAction func sizeClicked(sender: UISegmentedControl) {
        if (0 == sender.selectedSegmentIndex) {
            self.bannerSize = CGSizeMake(320, 50)
        } else {
            self.bannerSize = CGSizeMake(728, 90)
        }
    }
}
