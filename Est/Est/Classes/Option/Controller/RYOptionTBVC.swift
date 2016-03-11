//
//  RYOptionTBVC.swift
//  Est
//
//  Created by 王荣庆 on 16/3/8.
//  Copyright © 2016年 Ryukie. All rights reserved.
//

import UIKit
import EstSharedKit


class RYOptionTBVC: UITableViewController {

    let optionInfos = NSArray(contentsOfFile: optionPlistPath)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
    }
    private func prepareTableView () {
        tableView.backgroundColor = col_lightGray
        tableView.registerClass(RYOptionCell.self, forCellReuseIdentifier: "reuseIdentifier")
        tableView.pagingEnabled = true
    }

    

    


}
// MARK: - Table view data source
extension RYOptionTBVC {
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return optionInfos![section]["header"] as? String
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return (optionInfos?.count)!
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dict = optionInfos![section] as! [String : AnyObject]
        return (dict["Options"]?.count)!
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! RYOptionCell
        let optionDict = optionInfos![indexPath.section]["Options"]!![indexPath.row] as! [String : AnyObject]
        cell.optionModel = RYOptionModel(dict: optionDict)
        return cell
    }
}
