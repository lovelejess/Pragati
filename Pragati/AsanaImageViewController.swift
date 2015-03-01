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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        defaultImageSegue.image = defaultImage
        sanskritSegue.text = sanskrit
        englishSegue.text = english
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
