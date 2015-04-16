//
//  AsanaTableViewControllerTest.swift
//  Pragati
//
//  Created by Jessica Le on 4/2/15.
//  Copyright (c) 2015 LoveLeJess. All rights reserved.
//

import UIKit
import XCTest

class AsanaTest: XCTestCase {
    
    func testAsanaIsInitializedWithValues(){
        let asana = Asana(sanskrit: "Adho Mukha Svanasana", english: "Downward Facing Dog", defaultImage: UIImage(named:"downwardFacingDog.png"))
        let sanskrit = "Adho Mukha Svanasana"
        let english = "Downward Facing Dog"
        
        XCTAssertEqual(sanskrit, asana.sanskrit, "Sanskrit is not set properly")
        XCTAssertEqual(english, asana.english, "English is not set properly")
        XCTAssertNotNil(asana.defaultImage, "Default Image is not set properly")
    }
}

