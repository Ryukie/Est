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

    lazy var appsList = RYApp.apps()
    var appAddedToLauncher = [RYApp]()
//    var appIndexInLauncher : Int64 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = col_purple
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
        let margin : CGFloat = (scrW - 4*appIconWidth)/5
        let sectionMargin : CGFloat = margin
        cv_fl.minimumInteritemSpacing = margin/2
        cv_fl.minimumLineSpacing = margin/2
        cv_fl.sectionInset = UIEdgeInsetsMake(sectionMargin, sectionMargin, sectionMargin, sectionMargin)
        cv_fl.itemSize = CGSizeMake(appIconWidth, appIconHeight+appNameLableHeight)
        
        view.addSubview(cv_appIcons!)
        cv_appIcons!.delegate = self
        cv_appIcons!.dataSource = self
        cv_appIcons?.registerClass(RYAppCellInside.self, forCellWithReuseIdentifier: "cell")
    }
    
    private var cv_appIcons : UICollectionView?
}
extension RYDeskTopVC : UICollectionViewDelegate,UICollectionViewDataSource,RYAppCellInsideDelegate,RYAppEditVCDelegate {
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! RYAppCellInside
        cell.delegate = self
        
        if indexPath.item < appAddedToLauncher.count {//返回已经添加进数组的Cell
            let app = appAddedToLauncher[indexPath.item]
                cell.app_model = app
                cell.appsList = appsList
                return cell
        } else {//当库存app数量少于界面cell的数量的时候会越界
            cell.app_model = nil
            cell.appsList = appsList
            return cell
        }

    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    }
    //点击添加按钮的代理方法
    func addApp(apps: [RYApp]) {
        let editoeVC = RYAppEditVC(apps: apps )
        editoeVC.delegate = self
        let navi = UINavigationController(rootViewController: editoeVC)
        presentViewController(navi, animated: true, completion: nil)
    }
    func addAppToLauncher (app: RYApp){
        app.isAdded = true
        appAddedToLauncher.append(app)
        for i in 0...appAddedToLauncher.count {
            app.app_index = Int64(i)
        }
        print(app.app_index)
        cv_appIcons?.reloadData()
//        print(app.name)
    }
}