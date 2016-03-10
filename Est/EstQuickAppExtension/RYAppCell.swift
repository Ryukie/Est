//
//  RYAppCell.swift
//  Est
//
//  Created by 王荣庆 on 16/3/9.
//  Copyright © 2016年 Ryukie. All rights reserved.
//

import UIKit

class RYAppCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor.blueColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
