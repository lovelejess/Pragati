//
//  AsanaTableViewController.swift
//  Pragati
//
//  Created by Jessica Le on 2/2/15.
//  Copyright (c) 2015 LoveLeJess. All rights reserved.
//

import Foundation
import UIKit

class AsanaTableViewController: UITableViewController {
    
    var asanas: [Asana] = asanaData

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return asanas.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let asanaCell = tableView.dequeueReusableCellWithIdentifier("AsanaCell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
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
                    destination.title = asanas[asanaIndex].english
                    //destination.defaultImage = asanas[asanaIndex].defaultImage!
                    //destination.sanskrit = asanas[asanaIndex].sanskrit
                    //destination.english = asanas[asanaIndex].english
                    
                }
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
