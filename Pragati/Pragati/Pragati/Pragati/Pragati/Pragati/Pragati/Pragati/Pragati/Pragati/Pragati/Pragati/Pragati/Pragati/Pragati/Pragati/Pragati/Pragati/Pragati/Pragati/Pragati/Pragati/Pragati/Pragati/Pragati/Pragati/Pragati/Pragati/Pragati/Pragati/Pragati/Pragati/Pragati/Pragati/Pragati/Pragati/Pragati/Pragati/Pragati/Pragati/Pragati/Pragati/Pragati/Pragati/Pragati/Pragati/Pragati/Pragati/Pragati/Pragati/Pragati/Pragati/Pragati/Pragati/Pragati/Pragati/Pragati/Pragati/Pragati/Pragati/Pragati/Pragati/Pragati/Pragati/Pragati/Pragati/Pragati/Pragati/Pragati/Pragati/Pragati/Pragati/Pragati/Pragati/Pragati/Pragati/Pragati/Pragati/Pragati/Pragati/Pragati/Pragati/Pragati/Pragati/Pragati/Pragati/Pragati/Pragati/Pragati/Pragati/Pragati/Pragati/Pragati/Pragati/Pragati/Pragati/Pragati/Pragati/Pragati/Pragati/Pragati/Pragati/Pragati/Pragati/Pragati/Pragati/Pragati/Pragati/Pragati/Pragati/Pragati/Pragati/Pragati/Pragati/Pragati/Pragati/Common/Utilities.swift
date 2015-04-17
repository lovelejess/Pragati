//
//  Utilities.swift
//  Pragati
//
//  Created by Jessica Le on 4/12/15.
//  Copyright (c) 2015 LoveLeJess. All rights reserved.
//

import Foundation

func parseAsanaName(name: String) -> String {
    return name.stringByReplacingOccurrencesOfString(" ", withString: "", options:NSStringCompareOptions.LiteralSearch, range: nil).stringByReplacingOccurrencesOfString(")", withString: "", options:NSStringCompareOptions.LiteralSearch, range: nil).stringByReplacingOccurrencesOfString(")", withString: "", options:NSStringCompareOptions.LiteralSearch, range: nil).stringByReplacingOccurrencesOfString("(", withString: "", options:NSStringCompareOptions.LiteralSearch, range: nil)
}