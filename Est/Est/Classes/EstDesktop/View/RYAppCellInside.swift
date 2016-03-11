//
//  RYAppCellInside.swift
//  Est
//
//  Created by 王荣庆 on 16/3/11.
//  Copyright © 2016年 Ryukie. All rights reserved.
//

import UIKit
import SnapKit
import EstSharedKit

class RYAppCellInside: UICollectionViewCell {
    
    var app_URL : String?
    
    var app_model : RYApp? {
        didSet {
            lb_appName.text = app_model?.app_name
            iv_appIcon.image = UIImage(named: (app_model?.app_iconName)!)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareCell()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareCell () {
        backgroundColor = .None
        
        contentView.addSubview(iv_appIcon)
        contentView.addSubview(lb_appName)
        iv_appIcon.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(appIconHeight)
            make.left.top.right.equalTo(self.contentView)
        }
        lb_appName.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(iv_appIcon.snp_bottom)
            make.left.right.bottom.equalTo(self.contentView)
            make.height.equalTo(appNameLableHeight)
        }
        
        iv_appIcon.image = UIImage(named: "bilibili60x60")
        iv_appIcon.layer.cornerRadius = 8
        iv_appIcon.layer.masksToBounds = true
        
        lb_appName.text = "BiliBili"
        lb_appName.textAlignment = .Center
        
    }
    
    private lazy var lb_appName : UILabel = UILabel()
    private lazy var iv_appIcon : UIImageView = UIImageView()
}
