//
//  AsanaImageViewController.swift
//  Pragati
//
//  Created by Jessica Le on 2/12/15.
//  Copyright (c) 2015 LoveLeJess. All rights reserved.
//

import UIKit

class AsanaImageViewController: UIViewController {

    @IBOutlet weak var sanskritSegue: UILabel!
    @IBOutlet weak var englishSegue: UILabel!
    @IBOutlet weak var defaultImageSegue: UIImageView!
    
    var sanskrit = String()
    var english = String()
    var defaultImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        defaultImageSegue.image = defaultImage
        sanskritSegue.text = sanskrit
        englishSegue.text = english
        
    }
}
