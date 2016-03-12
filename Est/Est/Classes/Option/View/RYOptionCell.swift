//
//  RYOptionCell.swift
//  Est
//
//  Created by 王荣庆 on 16/3/8.
//  Copyright © 2016年 Ryukie. All rights reserved.
//

import UIKit
import EstSharedKit

class RYOptionCell: UITableViewCell {
	
    var optionModel : RYOptionModel? {
        didSet {
            textLabel?.text = optionModel!.title
            textLabel?.textColor = col_95White
            detailTextLabel?.text = optionModel!.targetVC
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .None
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
