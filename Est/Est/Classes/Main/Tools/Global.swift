//
//  Global.swift
//  Est
//
//  Created by 王荣庆 on 16/3/8.
//  Copyright © 2016年 Ryukie. All rights reserved.
//

import UIKit
 /// 屏幕尺寸
public let scrW = UIScreen.mainScreen().bounds.width
public let scrH = UIScreen.mainScreen().bounds.height
 /// 颜色
public let col_blue = UIColor.blueColor()
public let col_red = UIColor.redColor()
public let col_lightGray = UIColor.lightGrayColor()
public let col_95White = UIColor(white: 0.95, alpha: 1)
public let col_darkGray = UIColor.darkGrayColor()

 /// option页面配置文件路径
public let optionPlistPath : String = NSBundle.mainBundle().pathForResource("OptionMainView.plist", ofType: nil)!
 /// appList
public let appListPath = NSBundle.mainBundle().pathForResource("AppList.plist", ofType: nil)

/// appIconSize
public let appIconWidth : CGFloat = 60
public let appIconHeight : CGFloat = appIconWidth
public let appNameLableHeight : CGFloat = 20
