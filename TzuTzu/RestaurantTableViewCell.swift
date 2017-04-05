//
//  RestaurantTableViewCell.swift
//  TzuTzu
//
//  Created by Yi-Chin Hsu on 2016/7/27.
//  Copyright © 2016年 Yi-Chin Hsu. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
        
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    


}
