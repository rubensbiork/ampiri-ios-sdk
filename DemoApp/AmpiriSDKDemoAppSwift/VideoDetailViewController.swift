//
//  VideoDetailViewController.swift
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 19/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import UIKit
import AmpiriSDK

class VideoDetailViewController: UIViewController {

    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var loadAndShowButton: UIButton!

    private var videoController: AMPVideoController?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadButton.layer.masksToBounds = true
        self.showButton.layer.masksToBounds = true
        self.loadAndShowButton.layer.masksToBounds = true

        self.loadButton.layer.cornerRadius = CGRectGetHeight(self.loadButton.frame) / 3
        self.showButton.layer.cornerRadius = CGRectGetHeight(self.showButton.frame) / 3
        self.loadAndShowButton.layer.cornerRadius = CGRectGetHeight(self.loadAndShowButton.frame) / 3
    }


    @IBAction func loadClicked(sender: UIButton) {
        AmpiriSDK.sharedSDK().loadVideoWithAdUnitId("87f65c4c-f12d-4bb6-96fd-063fe30c4d69", success: {
            (videoViewController) in
            self.videoController = videoViewController
        }, failure: nil)
    }

    @IBAction func showClicked(sender: UIButton) {
        self.videoController?.showFromViewController(self)
    }

    @IBAction func loadAndShowClicked(sender: UIButton) {
        AmpiriSDK.sharedSDK().loadVideoWithAdUnitId("87f65c4c-f12d-4bb6-96fd-063fe30c4d69", success: {
            (videoViewController) in
            videoViewController.showFromViewController(self)
        }, failure: nil)
    }

}
