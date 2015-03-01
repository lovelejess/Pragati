//
//  Asana.swift
//  Pragati
//
//  Created by Jessica Le on 2/2/15.
//  Copyright (c) 2015 LoveLeJess. All rights reserved.
//

import UIKit

@objc
class Asana: NSObject {
    var sanskrit: String
    var english: String
    var defaultImage: UIImage?
    
    init(sanskrit: String, english:String, defaultImage: UIImage?){
        self.sanskrit = sanskrit
        self.english = english
        self.defaultImage = defaultImage
        super.init()
        
    }
}
