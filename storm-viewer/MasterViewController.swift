//
//  MasterViewController.swift
//  storm-viewer
//
//  Created by Renan Kosicki on 8/28/15.
//  Copyright (c) 2015 Renan Kosicki. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var objects = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addImagesToArray()
    }
    
    func addImagesToArray() {
        let fileManager = NSFileManager.defaultManager()
        let path = NSBundle.mainBundle().resourcePath!
        let items = fileManager.contentsOfDirectoryAtPath(path, error: nil)
        
        for item in items as! [String] {
            if item.hasPrefix("nssl") {
                objects.append(item)
            }
        }
    }
    
    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let detailViewController = segue.destinationViewController as! DetailViewController
                detailViewController.detailItem = objects[indexPath.row]
            }
        }
    }
}

extension MasterViewController: UITableViewDataSource, UITableViewDelegate {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        let object = objects[indexPath.row]
        cell.textLabel!.text = object as String
        return cell
    }
}
