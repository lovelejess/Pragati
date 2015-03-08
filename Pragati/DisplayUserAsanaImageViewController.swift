//
//  DisplayUserAsanaImageViewController.swift
//  Pragati
//
//  Created by Jessica Le on 3/6/15.
//  Copyright (c) 2015 LoveLeJess. All rights reserved.
//

import UIKit

class DisplayUserAsanaImageViewController: UIViewController {
    
    @IBOutlet weak var selectedUserPhoto: UIImageView!
    
    var userPhoto = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        selectedUserPhoto.image = userPhoto

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
