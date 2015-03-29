//
//  UserPhotoCollectionViewController.swift
//  Pragati
//
//  Created by Jessica Le on 3/5/15.
//  Copyright (c) 2015 LoveLeJess. All rights reserved.
//

import UIKit
import MobileCoreServices
import CoreData

class UserPhotoCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    var asanaPhotoCollection: [NSManagedObject]!
    
    @IBOutlet weak var addUserPhotoButton: UIBarButtonItem!
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        reloadData()
        self.collectionView?.reloadData()
        
    }
    
    func reloadData(){
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName: self.title!)
        var fetchingError: NSError?
        let fetchResults = managedContext.executeFetchRequest(fetchRequest, error: &fetchingError) as [NSManagedObject]?
        
        if let results = fetchResults {
            asanaPhotoCollection = results
        }
        else {
            println("Could not fetch \(fetchingError), \(fetchingError!.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if asanaPhotoCollection.isEmpty{
            return 0
        }
        return asanaPhotoCollection.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let userPhotoCell = collectionView.dequeueReusableCellWithReuseIdentifier("UserPhotoCell", forIndexPath: indexPath) as UserPhotoCollectionViewCell

        // Configure the cell
        if !asanaPhotoCollection.isEmpty{
            userPhotoCell.userPhoto?.image = asanaPhotoCollection[indexPath.row].valueForKey("photo") as UIImage?        }

        return userPhotoCell
        
    }
    
    @IBAction func cameraRoll(sender: AnyObject) {
        picker.allowsEditing = false
        picker.sourceType = .PhotoLibrary
        picker.modalPresentationStyle = .Popover
        presentViewController(picker, animated: true, completion: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DisplayAsanaPhoto" {
            if let destination = segue.destinationViewController as? DisplayUserAsanaImageViewController {
            
                let photoCell : UserPhotoCollectionViewCell = sender as UserPhotoCollectionViewCell
                
                destination.userPhoto = photoCell.userPhoto.image!

            }
        }
        
        if segue.identifier == "AddPhotoToSelectedAsana" {
            if let destination = segue.destinationViewController as? AddUserPhotoViewController {
                
                destination.asanaPhotoCollection = asanaPhotoCollection
                destination.asanaName = self.title?.stringByReplacingOccurrencesOfString(" ", withString: "", options:NSStringCompareOptions.LiteralSearch, range: nil).stringByReplacingOccurrencesOfString(")", withString: "", options:NSStringCompareOptions.LiteralSearch, range: nil).stringByReplacingOccurrencesOfString("(", withString: "", options:NSStringCompareOptions.LiteralSearch, range: nil)
            }
        }

    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
