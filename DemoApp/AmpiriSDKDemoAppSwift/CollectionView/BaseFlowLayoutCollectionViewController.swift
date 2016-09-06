//
// Created by Viacheslav Leonov on 12.08.16.
// Copyright (c) 2016 glispa.com. All rights reserved.
//

import Foundation

@objc(BaseFlowLayoutCollectionViewController)
class BaseFlowLayoutCollectionViewController: BaseCollectionViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.registerNib(UINib.init(nibName: NSStringFromClass(AMPLocationControlCollectionViewCell), bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: NSStringFromClass(AMPLocationControlCollectionViewCell))
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return dataSource.count
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource[section].count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: AMPLocationControlCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("AMPLocationControlCollectionViewCell", forIndexPath: indexPath) as! AMPLocationControlCollectionViewCell

        let item: AMPDataUnit = self.dataSource[indexPath.section][indexPath.row]
        cell.tweetNameLabel.text = item.name
        if let imageHeightConstraint = cell.tweetImageHeightConstraint {
            if item.photo == nil {
                imageHeightConstraint.constant = 0
            } else {
                imageHeightConstraint.constant = (self.collectionView.frame.size.width - 4) / 2
            }
        }

        cell.tweetImageView.image = UIImage(named: item.photo)

        if let textLabel = cell.tweetTextLabel {
            textLabel.text = item.specification
        }

        cell.layoutIfNeeded()
        
        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: Int((collectionView.frame.size.width - 4) / 2.0), height: Int((collectionView.frame.size.width - 4) / 1.1))
    }

    func loadData(count: UInt, from: UInt) -> [[AMPDataUnit]] {
        let units = AMPDataUnitManager.createDataUnitList(count, from: from)
        return organizeData(units, dividedBySectionsCount: 2)
    }

    func organizeData(dataArray: [AMPDataUnit], dividedBySectionsCount sectionsCount: Int) -> [[AMPDataUnit]] {
        var sections = [[AMPDataUnit]]()
        let itemsInSection: Int = Int(dataArray.count / sectionsCount)
        var startPos: Int = 0
        for _ in 0 ..< sectionsCount {
            let lastPosition = min(startPos + itemsInSection, dataArray.count)
            let itemsGroupe = Array(dataArray[startPos ..< lastPosition])
            startPos += itemsGroupe.count
            sections.append(itemsGroupe)
        }

        if startPos < dataArray.count {
            var itemsGroupe = sections[sections.count - 1]
            itemsGroupe += dataArray[startPos ..< dataArray.count]
            sections[sections.count - 1] = itemsGroupe
        }
        return sections;
    }
}
