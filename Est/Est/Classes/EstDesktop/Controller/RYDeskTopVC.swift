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
        cell.tag = indexPath.item
        if indexPath.item < appAddedToLauncher.count {//返回已经添加进数组的Cell
            let app = appAddedToLauncher[indexPath.item]
                cell.app_model = app
                return cell
        } else {//当库存app数量少于界面cell的数量的时候会越界
            cell.app_model = nil
            return cell
        }

    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if appAddedToLauncher.count == 0 {
            return 1
        }else if appAddedToLauncher.count>=16 {
            return 16
        }else {
            return appAddedToLauncher.count + 1
        }
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    }
    //点击添加按钮的代理方法
    func addApp(cell:RYAppCellInside) {
        let editoeVC = RYAppEditVC(style: .Plain)
        editoeVC.delegate = self
        editoeVC.fromCell = cell
        let navi = UINavigationController(rootViewController: editoeVC)
        presentViewController(navi, animated: true, completion: nil)
    }
    func deleteApp(cell:RYAppCellInside) {
        if appAddedToLauncher.count != 0 {
            appAddedToLauncher.removeAtIndex(cell.tag)
            cv_appIcons?.reloadData()
        }
    }
    func addAppToLauncher (app: RYApp,toCell:RYAppCellInside){
        if toCell.app_model != nil {
            appAddedToLauncher.removeAtIndex(toCell.tag)
            appAddedToLauncher.insert(app , atIndex: toCell.tag)
        }else {
            appAddedToLauncher.append(app)
        }
        cv_appIcons?.reloadData()
    }
}