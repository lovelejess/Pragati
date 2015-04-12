//
//  AddUserPhotoViewController.swift
//  Pragati
//
//  Created by Jessica Le on 3/8/15.
//  Copyright (c) 2015 LoveLeJess. All rights reserved.
//

import UIKit
import CoreData

class AddUserPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var capturePhotoButton: UIBarButtonItem!
    @IBOutlet weak var selectedPhoto: UIImageView!
    @IBOutlet weak var savePhotoButton: UIBarButtonItem!
    
    let photoAlbumPicker = UIImagePickerController()
    
    var asanaPhotoCollection: [NSManagedObject]!
    var asanaName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoAlbumPicker.delegate = self
        savePhotoButton.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func saveToPhotoCollection(photoToSave: UIImage?){
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let entity =  NSEntityDescription.entityForName(asanaName!,
            inManagedObjectContext:
            managedContext)
        
        let asanaPhoto = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext:managedContext)
        
        asanaPhoto.setValue(1, forKey: "id")
        asanaPhoto.setValue(photoToSave, forKey: "photo")
        asanaPhoto.setValue(NSDate(),forKey: "date")
        
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }  

        asanaPhotoCollection.append(asanaPhoto)
 
    }
        
    @IBAction func savePhoto(){
        var photoToSave: UIImage?
        photoToSave = selectedPhoto.image!
        if (photoToSave != nil) {
            saveToPhotoCollection(photoToSave)
            UIImageWriteToSavedPhotosAlbum(photoToSave, nil, nil, nil)
            displaySuccessfullSavePopUp()
        }
    }
    
    func displaySuccessfullSavePopUp(){
        let successfullAlert = UIAlertController(title: "Photo Saved", message: "Successfully Saved!", preferredStyle: UIAlertControllerStyle.Alert)
        let acknowledgedButton = UIAlertAction(title: "Namaste", style: .Default) { (action) -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)

            }
        successfullAlert.addAction(acknowledgedButton)
        self.presentViewController(successfullAlert, animated: true, completion: nil)
        
    }
    
     func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        selectedPhoto.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        selectedPhoto.contentMode = .ScaleAspectFit
        savePhotoButton.enabled = true
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func cancelButton(sender: UIStoryboardSegue){
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func cameraRoll(sender: AnyObject) {
        photoAlbumPicker.sourceType = .PhotoLibrary
        photoAlbumPicker.modalPresentationStyle = .Popover
        photoAlbumPicker.allowsEditing = false
        presentViewController(photoAlbumPicker, animated: true, completion: nil)
    }
    
    @IBAction func capturePhoto(sender: UIBarButtonItem) {
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
            photoAlbumPicker.sourceType = UIImagePickerControllerSourceType.Camera
            photoAlbumPicker.cameraCaptureMode = .Photo
            photoAlbumPicker.allowsEditing = false
            
            presentViewController(photoAlbumPicker, animated: true, completion: nil)
        } else {
           cameraNotFound()
        }
    }
    
    func cameraNotFound(){
        let alertPopUp = UIAlertController(title: "Error: No Camera Detected", message: "How am I supposed to capture a photo without a camera?!", preferredStyle: .Alert)
        let dismissButton = UIAlertAction(title: "Oh, silly me!", style:.Default, handler: nil)
        alertPopUp.addAction(dismissButton)
        presentViewController(alertPopUp, animated: true, completion: nil)
    }

}
