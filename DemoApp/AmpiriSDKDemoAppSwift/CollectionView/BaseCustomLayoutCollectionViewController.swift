//
// Created by Glispa GmbH on 12.08.16.
// Copyright (c) 2016 Glispa GmbH All rights reserved.
//

import Foundation

@objc(BaseCustomLayoutCollectionViewController)
class BaseCustomLayoutCollectionViewController: BaseCollectionViewController, UICollectionViewDelegate, UICollectionViewDataSource, CollectionViewCircleLayoutTwoKindDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.register(UINib.init(nibName: NSStringFromClass(AMPLocationControlCustomCollectionViewCell.self), bundle: Bundle.main), forCellWithReuseIdentifier: NSStringFromClass(AMPLocationControlCustomCollectionViewCell.self))
        applyCustomLayoutMode()
        loadData()
    }


    fileprivate func applyCustomLayoutMode() {
        let customLayout: CollectionViewCircleLayout = CollectionViewCircleLayout()
        customLayout.delegate = self;
        self.collectionView.setCollectionViewLayout(customLayout, animated: false) {
            finished in
            self.collectionView.reloadData()
        }
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        assert(true, "should be called from derived class")
        return UICollectionViewCell.init()
    }

    func shouldUseDefaultAttributeForItem(at indexPath: IndexPath!) -> Bool {
        assert(true, "should be called from derived class")
        return false
    }

    func loadData() {
        let units = AMPDataUnitManager.createDataUnitList(20)
        self.dataSource = organizeData(units, dividedBySectionsCount: 1)
    }


    func organizeData(_ dataArray: [AMPDataUnit], dividedBySectionsCount sectionsCount: Int) -> [[AMPDataUnit]] {
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
