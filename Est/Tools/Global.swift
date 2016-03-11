//
//  Global.swift
//  Est
//
//  Created by 王荣庆 on 16/3/8.
//  Copyright © 2016年 Ryukie. All rights reserved.
//

import UIKit

let scrW = UIScreen.mainScreen().bounds.width
let scrH = UIScreen.mainScreen().bounds.height

let col_blue = UIColor.blueColor()
let col_red = UIColor.redColor()
let col_lightGray = UIColor.lightGrayColor()
let col_95White = UIColor(white: 0.95, alpha: 1)
let col_darkGray = UIColor.darkGrayColor()

/**
*  Option页面 plist文件路径
*/
let optionPlistPath : String = NSBundle.mainBundle().pathForResource("OptionMainView.plist", ofType: nil)!
