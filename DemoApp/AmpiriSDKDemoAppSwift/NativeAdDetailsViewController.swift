//
//  NativeAdDetailsViewController.swift
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 19/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import UIKit

class NativeAdDetailsViewController: UIViewController {
    
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var loadAndShowButton: UIButton!
    @IBOutlet weak var templateSwitch: UISegmentedControl!
    @IBOutlet weak var adContainerView: UIView!
    
    @IBOutlet weak var nativeContainerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var nativeContainerBottomConstraint: NSLayoutConstraint!
    
    private var desiredHeight: CGFloat = 0
    
    private var nativeView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadButton.layer.masksToBounds = true
        self.showButton.layer.masksToBounds = true
        self.loadAndShowButton.layer.masksToBounds = true
        
        self.loadButton.layer.cornerRadius = CGRectGetHeight(self.loadButton.frame) / 3
        self.showButton.layer.cornerRadius = CGRectGetHeight(self.showButton.frame) / 3
        self.loadAndShowButton.layer.cornerRadius = CGRectGetHeight(self.loadAndShowButton.frame) / 3
        self.showButton.enabled = false
        
        self.templateSwitch.selectedSegmentIndex = 0
    }
    
    @IBAction func loadClicked(sender: UIButton) {
        self.showButton.enabled = false
        
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
        
        AmpiriSDK.sharedSDK().loadNativeAdWithIdentifier("7f900c7d-7ce3-4190-8e93-310053e70ca2", parentViewController:self, adViewClassForRendering: classForRendering, success: { (view) in
            self.nativeView = view
            self.showButton.userInteractionEnabled = true;
            self.showButton.enabled = true;
            }, failure: nil)
    }
    
    @IBAction func showClicked(sender: UIButton) {
        self.renderBannerAd()
    }
    
    @IBAction func loadAndShowClicked(sender: UIButton) {
        self.showButton.enabled = false
        
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
        
        AmpiriSDK.sharedSDK().loadNativeAdWithIdentifier("7f900c7d-7ce3-4190-8e93-310053e70ca2", parentViewController:self,  adViewClassForRendering: classForRendering, success: { (view) in
            self.nativeView = view
            self.renderBannerAd()
            }, failure: nil)
    }
    
    // MARK: - Private
    
    private func prepareHeight() {
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
    
    private func renderBannerAd() {
        if self.nativeView?.superview == nil {
            self.nativeContainerHeightConstraint.constant = self.desiredHeight
            self.adContainerView.layoutIfNeeded()
            
            self.nativeView!.frame = self.adContainerView.bounds;
            self.nativeView!.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
            self.adContainerView.addSubview(self.nativeView!)
            
            self.showBannerWithAnimation(true)
        }
    }
    
    private func showBannerWithAnimation(animated:Bool) {
        self.nativeContainerBottomConstraint.constant = 0;
        if (animated) {
            UIView.animateWithDuration(0.2, animations: {
            })
        } else {
            self.adContainerView.layoutIfNeeded()
        }
    }
}
