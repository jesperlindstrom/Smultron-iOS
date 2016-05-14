//
//  MasterViewController.swift
//  Smultron
//
//  Created by Marco Koivisto on 2016-05-12.
//  Copyright © 2016 Marco Koivisto. All rights reserved.
//

import UIKit

class MatchViewController: UINavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.navigationBar.barTintColor = UIColor.whiteColor()
        navigationController!.navigationItem.backBarButtonItem?.tintColor = UIColor.blackColor()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func insertNewObject(sender: AnyObject) {
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        /*if segue.identifier == "showDetail" {
         if let indexPath = self.tableView.indexPathForSelectedRow {
         let object = objects[indexPath.row] as! NSDate
         let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
         controller.detailItem = object
         controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
         controller.navigationItem.leftItemsSupplementBackButton = true
         }
         }*/
    }
    
    
}

