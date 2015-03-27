//
//  AddUserPhotoViewController.swift
//  Pragati
//
//  Created by Jessica Le on 3/8/15.
//  Copyright (c) 2015 LoveLeJess. All rights reserved.
//

import UIKit
import CoreData

class AddUserPhotoViewController: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var capturePhotoButton: UIBarButtonItem!
    @IBOutlet weak var selectedPhoto: UIImageView!
    @IBOutlet weak var savePhotoButton: UIBarButtonItem!
    
    let picker = UIImagePickerController()
    
    var asanaPhotoCollection: [NSManagedObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.delegate = self
        savePhotoButton.enabled = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveToPhotoCollection(photoToSave: UIImage?){
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        let entity =  NSEntityDescription.entityForName("DownwardFacingDog",
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
        picker.sourceType = .PhotoLibrary
        picker.modalPresentationStyle = .Popover
        picker.allowsEditing = false
        presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func capturePhoto(sender: UIBarButtonItem) {
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            picker.cameraCaptureMode = .Photo
            picker.allowsEditing = false
            
            presentViewController(picker, animated: true, completion: nil)
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
