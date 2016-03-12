//
//  TodayViewController.swift
//  EstQuickAppExtension
//
//  Created by 王荣庆 on 16/3/8.
//  Copyright © 2016年 Ryukie. All rights reserved.
//

import UIKit
import NotificationCenter
import EstSharedKit

class TodayViewController: UIViewController, NCWidgetProviding ,UICollectionViewDataSource,UICollectionViewDelegate{
        
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCollectionView()
    }
    
    private func prepareCollectionView () {
        cv_apps.registerClass(RYAppCell.self, forCellWithReuseIdentifier: "AppCell")
        cv_apps.backgroundColor = .None//消除背景
        cv_apps.scrollEnabled = false
        let cv_Wid : CGFloat = UIScreen.mainScreen().bounds.width
        let cv_Hig : CGFloat = 171
        self.preferredContentSize = CGSizeMake(cv_Wid, cv_Hig)
        
        let margin : CGFloat = (scrW - 4*appIconWidth)/5
        let sectionMargin : CGFloat = margin
        fl_appFlowLayout.sectionInset = UIEdgeInsetsMake(0, sectionMargin, 0, sectionMargin)
        fl_appFlowLayout.minimumInteritemSpacing = margin/2
        fl_appFlowLayout.minimumLineSpacing = margin/2
        fl_appFlowLayout.scrollDirection = .Vertical
        fl_appFlowLayout.itemSize = CGSizeMake(appIconWidth, appIconHeight)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {

        completionHandler(NCUpdateResult.NewData)
    }
    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return insets
    }
    
    @IBOutlet weak var cv_apps : UICollectionView!
    @IBOutlet weak var fl_appFlowLayout : UICollectionViewFlowLayout!
}
extension TodayViewController {
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = cv_apps.dequeueReusableCellWithReuseIdentifier("AppCell", forIndexPath: indexPath) as! RYAppCell
        return cell
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let str: String = "prefs:"
//        let str : String = "weixin://com.wx.test?viewId=letters"
        let url : NSURL = NSURL(string: str)!
        extensionContext?.openURL(url, completionHandler: nil)
    }
}
