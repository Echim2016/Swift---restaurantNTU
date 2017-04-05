//
//  RestaurantDetailTableViewCell.swift
//  TzuTzu
//
//  Created by Yi-Chin Hsu on 2016/8/9.
//  Copyright © 2016年 Yi-Chin Hsu. All rights reserved.
//

import UIKit

class RestaurantDetailTableViewCell: UITableViewCell {

    @IBOutlet var fieldLabel:UILabel!
    @IBOutlet var valueLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
