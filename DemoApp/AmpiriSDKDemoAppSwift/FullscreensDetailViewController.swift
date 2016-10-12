//
//  FullscreensDetailViewController.swift
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 19/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import UIKit
import AmpiriSDK


class FullscreensDetailViewController: UIViewController {

    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var loadAndShowButton: UIButton!
    @IBOutlet weak var loadAndShowWithDelayButton: UIButton!

    fileprivate var fullscreenController: AMPFullscreenBannerController?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadButton.layer.masksToBounds = true
        self.showButton.layer.masksToBounds = true
        self.loadAndShowButton.layer.masksToBounds = true
        self.loadAndShowWithDelayButton.layer.masksToBounds = true

        self.loadButton.layer.cornerRadius = self.loadButton.frame.height / 3
        self.showButton.layer.cornerRadius = self.showButton.frame.height / 3
        self.loadAndShowButton.layer.cornerRadius = self.loadAndShowButton.frame.height / 3
        self.loadAndShowWithDelayButton.layer.cornerRadius = self.loadAndShowWithDelayButton.frame.height / 3
    }


    @IBAction func loadClicked(_ sender: UIButton) {
        AmpiriSDK.shared().loadFullscreen(withAdUnitId: "2cb34a73-0012-4264-9526-bde1fce2ba92", options: .default, for: self, success: {
            fullscreenViewController in
            self.fullscreenController = fullscreenViewController
        }, failure: nil)
    }

    @IBAction func showClicked(_ sender: UIButton) {
        self.fullscreenController?.show(from: self)
    }

    @IBAction func loadAndShowClicked(_ sender: UIButton) {
        AmpiriSDK.shared().loadFullscreen(withAdUnitId: "2cb34a73-0012-4264-9526-bde1fce2ba92", options: .showAfterLoad, for: self, success: nil, failure: nil)
    }

    @IBAction func loadAndShowWithDelayClicked(_ sender: UIButton) {
        AmpiriSDK.shared().loadFullscreen(withAdUnitId: "2cb34a73-0012-4264-9526-bde1fce2ba92", options: .showAfterLoadWithDelay, for: self, success: nil, failure: nil)
    }

}
