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
//    var isAdded : Bool = false //是否被添加进数组
    var isShowed : Bool = false //是否被添加到展示界面上了
    
    convenience init (dict:[String : AnyObject]) {
        self.init()
        setValuesForKeysWithDictionary(dict)
    }

}
