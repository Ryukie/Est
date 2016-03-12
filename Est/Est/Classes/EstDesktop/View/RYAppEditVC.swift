//
//  RYAppEditVC.swift
//  Est
//
//  Created by 王荣庆 on 16/3/12.
//  Copyright © 2016年 Ryukie. All rights reserved.
//

import UIKit
import EstSharedKit

let reuseIdentifier = "Cell"

@objc protocol RYAppEditVCDelegate : NSObjectProtocol {
    func addAppToLauncher (app: RYApp,toCell:RYAppCellInside)
}

class RYAppEditVC: UITableViewController {
    
    weak var delegate : RYAppEditVCDelegate?
    var appsList : [RYApp] = RYAppPackage.sharedAppPackage.appsPackage
    var selectApp : RYApp?
    var fromCell : RYAppCellInside?

    override init(style: UITableViewStyle) {
        super.init(style: style)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: "clickCancle")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "clickDone")
        tableView.registerClass(RYEditorCell.self, forCellReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc private func clickCancle () {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @objc private func clickDone () {
        if (selectApp != nil) {
            delegate?.addAppToLauncher(selectApp!, toCell: fromCell!)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
// MARK: - 数据源及代理方法
extension RYAppEditVC {
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appsList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! RYEditorCell
        cell.backgroundColor = UIColor.randomColor()
        let app = appsList[indexPath.row]
        cell.app_model = app
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let currentApp = appsList[indexPath.row]
        selectApp = currentApp
    }
}