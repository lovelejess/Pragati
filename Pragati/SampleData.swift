//
//  SampleData.swift
//  Pragati
//
//  Created by Jessica Le on 2/2/15.
//  Copyright (c) 2015 LoveLeJess. All rights reserved.
//

import Foundation
import UIKit

let asanaData = [Asana(sanskrit: "Adho Mukha Svanasana", english: "Downward Facing Dog", defaultImage: UIImage(named:"downwardFacingDog.png")),
                Asana(sanskrit: "Urdhva Dhanursana", english: "Upward Bow Pose", defaultImage: UIImage(named:"wheel.png")),
                Asana(sanskrit: "Trikonasana (Left)", english: "Triangle (Left)", defaultImage: UIImage(named:"triangle.jpeg")),
                Asana(sanskrit: "Trikonasana (Right)", english: "Triangle (Right)",defaultImage: UIImage(named:"triangle.jpeg"))]

let asanaMap: [String : [AsanaPhoto]] = ["Downward Facing Dog": downwardFacingDogPhotos,
                                        "Upward Bow Pose": wheelPhotos,
                                        "Triangle (Left)": triangleLeft,
                                        "Triangle (Right)": triangleRight]

let defaultPhotos = [AsanaPhoto(date: NSDate(), photo: UIImage(named: "wheel"))]

let downwardFacingDogPhotos =
                [AsanaPhoto(date: NSDate(), photo: UIImage(named: "hdstd-rockies.JPG")),
                 AsanaPhoto(date: NSDate(), photo: UIImage(named: "hdstd-rockies.JPG"))]

let wheelPhotos =
                [AsanaPhoto(date: NSDate(), photo: UIImage(named: "hdstd-funkyLegs.JPG")),
                 AsanaPhoto(date: NSDate(), photo: UIImage(named: "hdstd-funkyLegs.JPG"))]

let triangleLeft =
                [AsanaPhoto(date: NSDate(), photo: UIImage(named: "hdstd-rockies.JPG")),
                AsanaPhoto(date: NSDate(), photo: UIImage(named: "hdstd-funkyLegs.JPG"))]

let triangleRight =
                [AsanaPhoto(date: NSDate(), photo: UIImage(named: "hdstd-funkyLegs.JPG"))]

