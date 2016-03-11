//
//  RYDeskTopVC.swift
//  Est
//
//  Created by 王荣庆 on 16/3/8.
//  Copyright © 2016年 Ryukie. All rights reserved.
//

import UIKit
import EstSharedKit

class RYDeskTopVC: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = col_lightGray
        prepareCollectionView()
    }
    
    private func prepareCollectionView () {
        
        let cv_frame = CGRectMake(0, 0, scrW, scrH)
        let cv_fl = UICollectionViewFlowLayout()
        cv_appIcons = UICollectionView(frame: cv_frame, collectionViewLayout: cv_fl)
        cv_appIcons!.frame = cv_frame
        cv_appIcons!.collectionViewLayout = cv_fl
        cv_appIcons!.backgroundColor = .None
        //SetFlowLayout
        cv_fl.minimumInteritemSpacing = 10
        cv_fl.minimumLineSpacing = 10
        cv_fl.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        cv_fl.itemSize = CGSizeMake(appIconWidth, appIconHeight+appNameLableHeight)
        
        view.addSubview(cv_appIcons!)
        cv_appIcons!.delegate = self
        cv_appIcons!.dataSource = self
        cv_appIcons?.registerClass(RYAppCellInside.self, forCellWithReuseIdentifier: "cell")
    }
    
    private var cv_appIcons : UICollectionView?
}
extension RYDeskTopVC : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! RYAppCellInside
        return cell
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
}