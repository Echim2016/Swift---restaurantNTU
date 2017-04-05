//
//  Restaurant.swift
//  TzuTzu
//
//  Created by Yi-Chin Hsu on 2016/8/4.
//  Copyright © 2016年 Yi-Chin Hsu. All rights reserved.
//

import Foundation

class Restaurant {

    var name = ""
    var type = ""
    var location = ""
    var image = ""
    var isLiked = false
    var rating = ""

    init(name: String, type: String, location: String, image: String, isLiked: Bool){
    
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isLiked = isLiked
    
    }

}
