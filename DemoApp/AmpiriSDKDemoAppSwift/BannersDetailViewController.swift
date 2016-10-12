//
//  BannersDetailViewController.swift
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 19/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import UIKit
import AmpiriSDK

class BannersDetailViewController: UIViewController {

    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var hideButton: UIButton!

    @IBOutlet weak var sizeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var autoupdateSwitch: UISwitch!

    fileprivate var bannerView: AMPBannerView!
    fileprivate var bannerSize: CGSize?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.showButton.layer.masksToBounds = true
        self.hideButton.layer.masksToBounds = true

        self.showButton.layer.cornerRadius = self.showButton.frame.height / 3
        self.hideButton.layer.cornerRadius = self.hideButton.frame.height / 3

        self.sizeClicked(self.sizeSegmentedControl)
    }


    @IBAction func showClicked(_ sender: UIButton) {
        if self.bannerView != nil {
            self.bannerView.stop()
            self.bannerView.removeFromSuperview()
            self.bannerView = nil
        }

        self.bannerView = AmpiriSDK.shared().loadBanner(with: self.bannerSize!, adUnitId: "04c447d7-ffb8-4ba1-985e-4d2b9f88cd69", success: nil, failure: nil)
        if (self.bannerView == nil) {
            return
        }
        self.view.addSubview(self.bannerView)

        self.bannerView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[bannerView(\(self.bannerSize!.height))]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["bannerView": self.bannerView]))

        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[bannerView(\(self.bannerSize!.width))]", options: .alignAllCenterX, metrics: nil, views: ["bannerView": self.bannerView]))
    }

    override func viewDidAppear(_ animated: Bool) {
        self.bannerView?.resumeAutoUpdate()
    }


    override func viewDidDisappear(_ animated: Bool) {
        self.bannerView?.pauseAutoUpdate()
    }

    @IBAction func hideClicked(_ sender: UIButton) {
        if self.bannerView != nil {
            self.bannerView?.stop()
            self.bannerView?.removeFromSuperview()
            self.bannerView = nil
        }
    }

    @IBAction func autoupdateSwitched(_ sender: UISwitch) {
        if (self.bannerView != nil) {
            self.bannerView!.autoUpdate = sender.isOn
        }
    }

    @IBAction func sizeClicked(_ sender: UISegmentedControl) {
        if (0 == sender.selectedSegmentIndex) {
            self.bannerSize = CGSize(width: 320, height: 50)
        } else {
            self.bannerSize = CGSize(width: 728, height: 90)
        }
    }
}
