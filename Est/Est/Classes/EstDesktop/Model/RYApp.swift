//
//  RYApp.swift
//  Est
//
//  Created by 王荣庆 on 16/3/11.
//  Copyright © 2016年 Ryukie. All rights reserved.
//

import UIKit
import EstSharedKit

class RYApp: NSObject {
    var name : String?
    var icon : String?
    var url : String? //URL Schemes
    var app_index : Int64?
    
    convenience init (dict:[String : AnyObject]) {
        self.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    class func apps () -> [RYApp] {
        let arr = NSArray(contentsOfFile: appListPath!)
        var tempArr = [RYApp]()
        for dict in arr! {
            let app = RYApp(dict: dict as! [String : AnyObject])
            tempArr.append(app)
        }
        return tempArr
    }
}
