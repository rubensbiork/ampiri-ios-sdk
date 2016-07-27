//
//  NativeBannerView.swift
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 19/05/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import UIKit
import AmpiriSDK

class NativeBannerView: AMPNativeView {

    static func desiredHeight() -> CGFloat {
        return 60.0
    }

    override static func xibName() -> String {
        return NSStringFromClass(self)
    }

}
