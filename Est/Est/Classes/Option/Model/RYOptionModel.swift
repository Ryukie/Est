//
//  RYOptionModel.swift
//  Est
//
//  Created by 王荣庆 on 16/3/8.
//  Copyright © 2016年 Ryukie. All rights reserved.
//

import UIKit
import EstSharedKit

class RYOptionModel: NSObject {
    var title : String?
    var targetVC : String?
    
    class func models ()-> NSArray{
        let arr = NSArray(contentsOfFile: optionPlistPath)
        return arr!
    }
    
    convenience init(dict:[String : AnyObject]) {
        self.init()
        setValuesForKeysWithDictionary(dict)
    }
}
