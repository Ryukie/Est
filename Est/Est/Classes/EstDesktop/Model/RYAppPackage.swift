//
//  RYAppPackage.swift
//  Est
//
//  Created by 王荣庆 on 16/3/12.
//  Copyright © 2016年 Ryukie. All rights reserved.
//

import UIKit
import EstSharedKit

class RYAppPackage: NSObject {
    
    let appsPackage : [RYApp] = {
        let arr = NSArray(contentsOfFile: appListPath!)
        var tempArr = [RYApp]()
        for dict in arr! {
            let app = RYApp(dict: dict as! [String : AnyObject])
            tempArr.append(app)
        }
        return tempArr
    }()
    
    static let sharedAppPackage : RYAppPackage = {
        let instance = RYAppPackage()
        return instance
    }()
    
    private override init() {
        super.init()
    }
}
