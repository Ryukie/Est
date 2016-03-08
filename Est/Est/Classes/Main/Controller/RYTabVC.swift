//
//  RYTabVC.swift
//  Est
//
//  Created by 王荣庆 on 16/3/8.
//  Copyright © 2016年 Ryukie. All rights reserved.
//

import UIKit

class RYTabVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewController(RYMainNaviVC(rootViewController:RYDeskTopVC()))
        addChildViewController(RYMainNaviVC(rootViewController:RYOptionTBVC()))
    }


}
