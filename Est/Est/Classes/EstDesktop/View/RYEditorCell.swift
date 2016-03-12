//
//  RYEditorCell.swift
//  Est
//
//  Created by 王荣庆 on 16/3/12.
//  Copyright © 2016年 Ryukie. All rights reserved.
//

import UIKit

class RYEditorCell: UITableViewCell {
    
    var app_model : RYApp? {
        didSet {
            textLabel?.text = app_model?.name
            imageView?.image = UIImage(named: "bilibili60x60")
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
