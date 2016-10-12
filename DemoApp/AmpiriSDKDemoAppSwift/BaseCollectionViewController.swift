//
//  BaseCollectionViewController.swift
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 12.08.16.
//  Copyright © 2016 Glispa GmbH All rights reserved.
//

import UIKit
import AmpiriSDK

class BaseCollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var loadButton: UIButton!
    var dataSource: [[AMPDataUnit]] = [[AMPDataUnit]]()

    @IBAction func loadClicked(_ sender: UIButton) {
    }

}
