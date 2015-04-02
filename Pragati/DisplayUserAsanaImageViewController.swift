//
//  DisplayUserAsanaImageViewController.swift
//  Pragati
//
//  Created by Jessica Le on 3/6/15.
//  Copyright (c) 2015 LoveLeJess. All rights reserved.
//

import UIKit
import CoreData

class DisplayUserAsanaImageViewController: UIViewController {
    
    @IBOutlet weak var selectedUserPhoto: UIImageView!
    
    var userPhoto = UIImage()
    var asanaName: String?
    var asanaPhotoCollection: [NSManagedObject]!
    
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
    
    @IBAction func displayActionSheet(){
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        
        let deletePhoto = UIAlertAction(title: "Delete", style: .Default) {(action) in         self.deletePhotoFromCollection()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        optionMenu.addAction(deletePhoto)
        optionMenu.addAction(cancelAction)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
    }
    
    func deletePhotoFromCollection(){
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName: asanaName!)
        fetchRequest.includesSubentities = false
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.predicate = NSPredicate(format:"photo == %@", userPhoto)
        var fetchingError: NSError?
        
        let fetchResults = managedContext.executeFetchRequest(fetchRequest, error: &fetchingError) as [NSManagedObject]!
        
        println("deleting object")
        managedContext.deleteObject(fetchResults[0] as NSManagedObject)
        managedContext.save(nil)
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
