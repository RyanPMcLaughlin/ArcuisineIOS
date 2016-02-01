//
//  SuggestionsTableViewController.swift
//  Arcuisine
//
//  Created by Student on 1/31/16.
//  Copyright © 2016 MikeAndRyan. All rights reserved.
//

import UIKit
import SwiftyJSON

class SuggestionsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel.text="Group \(GID)"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    @IBOutlet weak var displayLabel: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Table view data sourc

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PLACES?.count ?? 0
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("deepCell", forIndexPath: indexPath)
        cell.textLabel?.text=PLACES?[indexPath.row]
        
        return cell
    }
}
