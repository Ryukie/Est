//
//  RYApp.swift
//  Est
//
//  Created by 王荣庆 on 16/3/11.
//  Copyright © 2016年 Ryukie. All rights reserved.
//

import UIKit

class RYApp: NSObject {
    var app_name : String?
    var app_iconName : String?
    var app_URL : String?
    var app_index : Int64?
    
    convenience init (dict:[String : AnyObject]) {
        self.init()
        setValuesForKeysWithDictionary(dict)
    }
    
}
