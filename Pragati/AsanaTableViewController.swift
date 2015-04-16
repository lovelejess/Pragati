//
//  AsanaTableViewController.swift
//  Pragati
//
//  Created by Jessica Le on 2/2/15.
//  Copyright (c) 2015 LoveLeJess. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AsanaTableViewController: UITableViewController {
    
    var asanas: [Asana] = asanaData
    
    var asanaPhotoCollection = [NSManagedObject]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.tableView.reloadData()
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return asanas.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let asanaCell = tableView.dequeueReusableCellWithIdentifier("AsanaCell", forIndexPath: indexPath) as! UITableViewCell

        let asana = asanas[indexPath.row] as Asana
        asanaCell.textLabel?.text = asana.sanskrit
        asanaCell.detailTextLabel?.text = asana.english
        asanaCell.imageView?.image = asana.defaultImage
        return asanaCell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DisplayUserAsanaPhotos" {
            if let destination = segue.destinationViewController as? UserPhotoCollectionViewController {
                
                if let asanaIndex = tableView.indexPathForSelectedRow()?.row {
                    var asanaSelectedName = (asanas[asanaIndex].english)
                    let asanaEntity = parseAsanaName(asanaSelectedName)
                    
                    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                    let managedContext = appDelegate.managedObjectContext!
                    
                    let fetchRequest = NSFetchRequest(entityName: asanaEntity)
                    var fetchingError: NSError?
                    let fetchResults = managedContext.executeFetchRequest(fetchRequest, error: &fetchingError) as! [NSManagedObject]?
                    
                    if let results = fetchResults {
                        destination.asanaPhotoCollection = results
                        destination.title = asanaSelectedName
                        destination.asanaName = parseAsanaName(asanaSelectedName)
                        
                    }
                    else {
                        println("Could not fetch \(fetchingError), \(fetchingError!.userInfo)")
                    }
                }
            }
        }
    }

}
