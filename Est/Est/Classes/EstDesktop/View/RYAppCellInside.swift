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

@objc protocol RYAppCellInsideDelegate : NSObjectProtocol {
    func addApp (cell:RYAppCellInside)
    func deleteApp (cell:RYAppCellInside)
}

class RYAppCellInside: UICollectionViewCell {
    
    var app_URL : String?
    var appsList : [RYApp]?
    weak var delegate : RYAppCellInsideDelegate?
    
    var app_model : RYApp? {
        didSet {
            if app_model != nil {
                lb_appName.text = app_model?.name
                bt_appIcon.setBackgroundImage(UIImage(named: "bilibili60x60"), forState: .Normal)
                bt_appIcon.setBackgroundImage(UIImage(named: "bilibili60x60"), forState: .Highlighted)
            }else {
                lb_appName.text = ""
                bt_appIcon.setBackgroundImage(UIImage(named: "app_pic_add"), forState: .Normal)
                bt_appIcon.setBackgroundImage(UIImage(named: "app_pic_add_highlighted"), forState: .Highlighted)
            }
            
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
        
        contentView.addSubview(bt_appIcon)
        contentView.addSubview(lb_appName)
        contentView.addSubview(bt_delete)
        bt_appIcon.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(appIconHeight)
            make.left.top.right.equalTo(self.contentView)
        }
        lb_appName.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(bt_appIcon.snp_bottom)
            make.left.right.bottom.equalTo(self.contentView)
            make.height.equalTo(appNameLableHeight)
        }
        bt_delete.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(contentView.snp_left)
            make.centerY.equalTo(contentView.snp_top)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }

        bt_appIcon.layer.cornerRadius = 8
        bt_appIcon.layer.masksToBounds = true
        bt_appIcon.addTarget(self, action: "clickAppIcon", forControlEvents: .TouchUpInside)
        
        
        lb_appName.text = ""
        lb_appName.textAlignment = .Center
        
        bt_delete.setBackgroundImage(UIImage(named: "app_delete"), forState: .Normal)
        bt_delete.addTarget(self, action: "clickDeleteBtn", forControlEvents: .TouchUpInside)
    }
    @objc private func clickAppIcon () {
        delegate?.addApp(self)
    }
    @objc private func clickDeleteBtn () {
        print(__FUNCTION__)
        delegate?.deleteApp(self)
    }
    
    private lazy var lb_appName : UILabel = UILabel()
    private lazy var bt_appIcon : UIButton = UIButton()
    private lazy var bt_delete : UIButton = UIButton()
}
