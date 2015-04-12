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
    var asanaName = String()
    @IBOutlet weak var addUserPhotoButton: UIBarButtonItem!
    let picker = UIImagePickerController()
    
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0);
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        reloadData()
        self.collectionView?.reloadData()
        
    }
    
    func reloadData(){
        asanaName = self.title!.stringByReplacingOccurrencesOfString(" ", withString: "", options:NSStringCompareOptions.LiteralSearch, range: nil).stringByReplacingOccurrencesOfString(")", withString: "", options:NSStringCompareOptions.LiteralSearch, range: nil).stringByReplacingOccurrencesOfString(")", withString: "", options:NSStringCompareOptions.LiteralSearch, range: nil).stringByReplacingOccurrencesOfString("(", withString: "", options:NSStringCompareOptions.LiteralSearch, range: nil)

        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let fetchRequest = NSFetchRequest(entityName: asanaName)
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
    }

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

        if !asanaPhotoCollection.isEmpty{
            userPhotoCell.userPhoto?.image = asanaPhotoCollection[indexPath.row].valueForKey("photo") as UIImage?
            
            if let date = asanaPhotoCollection[indexPath.row].valueForKey("date") as? NSDate {
                var dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "MM-dd-yy"
                var dateString = dateFormatter.stringFromDate(date)
                userPhotoCell.date.text = dateString
                }
        }

        return userPhotoCell
        
    }
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize {
            return CGSize(width: 90 , height: 110)
    }
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return sectionInsets
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
                destination.asanaPhotoCollection = asanaPhotoCollection
                destination.title = asanaName
                destination.asanaName = asanaName
            }
        }
        
        if segue.identifier == "AddPhotoToSelectedAsana" {
            if let destination = segue.destinationViewController as? AddUserPhotoViewController {
                
                destination.asanaPhotoCollection = asanaPhotoCollection
                destination.asanaName = asanaName
            }
        }

    }

}
