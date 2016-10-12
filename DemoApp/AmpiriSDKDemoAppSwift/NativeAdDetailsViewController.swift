//
//  NativeAdDetailsViewController.swift
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 19/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import UIKit
import AmpiriSDK

class NativeAdDetailsViewController: UIViewController {

    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var loadAndShowButton: UIButton!
    @IBOutlet weak var templateSwitch: UISegmentedControl!
    @IBOutlet weak var adContainerView: UIView!

    @IBOutlet weak var nativeContainerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var nativeContainerBottomConstraint: NSLayoutConstraint!

    fileprivate var desiredHeight: CGFloat = 0

    fileprivate var nativeView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadButton.layer.masksToBounds = true
        self.showButton.layer.masksToBounds = true
        self.loadAndShowButton.layer.masksToBounds = true

        self.loadButton.layer.cornerRadius = self.loadButton.frame.height / 3
        self.showButton.layer.cornerRadius = self.showButton.frame.height / 3
        self.loadAndShowButton.layer.cornerRadius = self.loadAndShowButton.frame.height / 3
        self.showButton.isEnabled = false

        self.templateSwitch.selectedSegmentIndex = 0
    }

    @IBAction func loadClicked(_ sender: UIButton) {
        self.showButton.isEnabled = false

        self.prepareHeight()

        if self.nativeView != nil {
            self.nativeView!.removeFromSuperview()
        }

        var classForRendering: AnyClass = AnyObject.self

        switch (self.templateSwitch.selectedSegmentIndex) {
        case 0:
            classForRendering = NativeBannerView.self


        case 1:
            classForRendering = NativePlusView.self

        default:
            break
        }

        AmpiriSDK.shared().loadNativeAd(withAdUnitId: "7f900c7d-7ce3-4190-8e93-310053e70ca2", parentViewController: self, adViewClassForRendering: classForRendering, success: {
            view in
            self.nativeView = view
            self.showButton.isUserInteractionEnabled = true;
            self.showButton.isEnabled = true;
        }, failure: nil)
    }

    @IBAction func showClicked(_ sender: UIButton) {
        self.renderBannerAd()
    }

    @IBAction func loadAndShowClicked(_ sender: UIButton) {
        self.showButton.isEnabled = false

        self.prepareHeight()

        if self.nativeView != nil {
            self.nativeView!.removeFromSuperview()
        }

        var classForRendering: AnyClass = AnyObject.self

        switch (self.templateSwitch.selectedSegmentIndex) {
        case 0:
            classForRendering = NativeBannerView.classForCoder()

        case 1:
            classForRendering = NativePlusView.classForCoder()

        default:
            break
        }

        AmpiriSDK.shared().loadNativeAd(withAdUnitId: "7f900c7d-7ce3-4190-8e93-310053e70ca2", parentViewController: self, adViewClassForRendering: classForRendering, success: {
            view in
            self.nativeView = view
            self.renderBannerAd()
        }, failure: nil)
    }

    // MARK: - Private

    fileprivate func prepareHeight() {
        var height: CGFloat = 0;
        switch (self.templateSwitch.selectedSegmentIndex) {
        case 0:
            height = NativeBannerView.desiredHeight()

        case 1:
            height = NativePlusView.desiredHeight()

        default:
            break;
        }
        self.desiredHeight = height;
    }

    fileprivate func renderBannerAd() {
        if self.nativeView?.superview == nil {
            self.nativeContainerHeightConstraint.constant = self.desiredHeight
            self.adContainerView.layoutIfNeeded()

            self.nativeView!.frame = self.adContainerView.bounds;
            self.nativeView!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.adContainerView.addSubview(self.nativeView!)

            self.showBannerWithAnimation(true)
        }
    }

    fileprivate func showBannerWithAnimation(_ animated: Bool) {
        self.nativeContainerBottomConstraint.constant = 0;
        if (animated) {
            UIView.animate(withDuration: 0.2, animations: {
            })
        } else {
            self.adContainerView.layoutIfNeeded()
        }
    }
}
