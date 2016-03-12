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
class RYAppEditVC: UITableViewController {
    
    var appsList : [RYApp]?
    
    convenience init(apps:[RYApp]?) {
        self.init()
        appsList = apps
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: "clickCancle")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "clickDone")
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (appsList?.count)!
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)
        cell.backgroundColor = UIColor.randomColor()
        let app = appsList![indexPath.row] 
        cell.textLabel?.text = app.name
        return cell
    }
    @objc private func clickCancle () {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @objc private func clickDone () {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
