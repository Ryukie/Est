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
        addSubViewController(RYDeskTopVC(), title: "Est", imageName: "extDeskTop", selectedImageName: "extDeskTop_selected")
        addSubViewController(RYOptionTBVC(), title: "Option", imageName: "extDeskTop", selectedImageName: "extDeskTop")
    }
    private func addSubViewController(viewController:UIViewController,title:String,imageName:String,selectedImageName:String) {
        let vc = RYMainNaviVC(rootViewController:viewController)
        viewController.title = title
        viewController.tabBarItem.image = UIImage(named:imageName)
        addChildViewController(vc)
    }


}
