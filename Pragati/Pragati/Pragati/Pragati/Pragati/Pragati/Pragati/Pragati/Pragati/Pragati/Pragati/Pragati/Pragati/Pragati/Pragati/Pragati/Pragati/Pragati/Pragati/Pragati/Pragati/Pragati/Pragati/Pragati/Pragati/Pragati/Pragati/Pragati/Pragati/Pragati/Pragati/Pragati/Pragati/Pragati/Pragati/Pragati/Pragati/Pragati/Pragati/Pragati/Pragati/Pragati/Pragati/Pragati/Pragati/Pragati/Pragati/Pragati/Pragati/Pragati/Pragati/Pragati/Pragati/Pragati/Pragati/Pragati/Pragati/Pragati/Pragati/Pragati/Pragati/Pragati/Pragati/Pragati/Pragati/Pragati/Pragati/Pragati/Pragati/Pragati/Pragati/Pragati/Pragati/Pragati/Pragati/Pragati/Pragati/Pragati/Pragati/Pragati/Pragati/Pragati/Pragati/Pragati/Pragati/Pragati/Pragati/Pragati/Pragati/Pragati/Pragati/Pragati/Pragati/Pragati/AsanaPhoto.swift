//
//  AsanaPhoto.swift
//  Pragati
//
//  Created by Jessica Le on 3/22/15.
//  Copyright (c) 2015 LoveLeJess. All rights reserved.
//

import UIKit

@objc
class AsanaPhoto: NSObject {
    var date: NSDate
    var photo: UIImage?
    
    
    init(date: NSDate, photo: UIImage?){
        self.date = date
        self.photo = photo
    }

}

