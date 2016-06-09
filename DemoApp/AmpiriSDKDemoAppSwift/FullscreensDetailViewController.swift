//
//  FullscreensDetailViewController.swift
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 19/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import UIKit


class FullscreensDetailViewController: UIViewController {
    
    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var  showButton: UIButton!
    @IBOutlet weak var  loadAndShowButton: UIButton!
    @IBOutlet weak var  loadAndShowWithDelayButton: UIButton!
    
    private var fullscreenController: AMPFullscreenBannerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadButton.layer.masksToBounds = true
        self.showButton.layer.masksToBounds = true
        self.loadAndShowButton.layer.masksToBounds = true
        self.loadAndShowWithDelayButton.layer.masksToBounds = true
        
        self.loadButton.layer.cornerRadius = CGRectGetHeight(self.loadButton.frame) / 3
        self.showButton.layer.cornerRadius = CGRectGetHeight(self.showButton.frame) / 3
        self.loadAndShowButton.layer.cornerRadius = CGRectGetHeight(self.loadAndShowButton.frame) / 3
        self.loadAndShowWithDelayButton.layer.cornerRadius = CGRectGetHeight(self.loadAndShowWithDelayButton.frame) / 3
    }

    
    @IBAction func loadClicked(sender: UIButton) {
        AmpiriSDK.sharedSDK().loadFullscreenWithIdentifier("00000000-0000-0000-0000-000000000002", options: .Default, forViewController: self, success: { (fullscreenViewController) in
                self.fullscreenController = fullscreenViewController
            }, failure: nil)
    }

    @IBAction func showClicked(sender: UIButton) {
        self.fullscreenController?.showFromViewController(self)
    }
    
    @IBAction func loadAndShowClicked(sender: UIButton) {
        AmpiriSDK.sharedSDK().loadFullscreenWithIdentifier("00000000-0000-0000-0000-000000000002", options: .ShowAfterLoad, forViewController: self, success: nil, failure: nil)
    }
    
    @IBAction func loadAndShowWithDelayClicked(sender: UIButton) {
        AmpiriSDK.sharedSDK().loadFullscreenWithIdentifier("00000000-0000-0000-0000-000000000002", options: .ShowAfterLoadWithDelay, forViewController: self, success: nil, failure: nil)
    }

}
