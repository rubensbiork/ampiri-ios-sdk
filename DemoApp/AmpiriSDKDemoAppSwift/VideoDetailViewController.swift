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

    fileprivate var videoController: AMPVideoController?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadButton.layer.masksToBounds = true
        self.showButton.layer.masksToBounds = true
        self.loadAndShowButton.layer.masksToBounds = true

        self.loadButton.layer.cornerRadius = self.loadButton.frame.height / 3
        self.showButton.layer.cornerRadius = self.showButton.frame.height / 3
        self.loadAndShowButton.layer.cornerRadius = self.loadAndShowButton.frame.height / 3
    }


    @IBAction func loadClicked(_ sender: UIButton) {
        AmpiriSDK.shared().loadVideo(withAdUnitId: "87f65c4c-f12d-4bb6-96fd-063fe30c4d69", success: {
            videoViewController in
            self.videoController = videoViewController
        }, failure: nil)
    }

    @IBAction func showClicked(_ sender: UIButton) {
        self.videoController?.show(from: self)
    }

    @IBAction func loadAndShowClicked(_ sender: UIButton) {
        AmpiriSDK.shared().loadVideo(withAdUnitId: "87f65c4c-f12d-4bb6-96fd-063fe30c4d69", success: {
            videoViewController in
            videoViewController?.show(from: self)
        }, failure: nil)
    }

}
