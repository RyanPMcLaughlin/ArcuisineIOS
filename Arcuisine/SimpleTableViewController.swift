//
//  SimpleTableViewController.swift
//  Arcuisine
//
//  Created by Student on 1/31/16.
//  Copyright © 2016 MikeAndRyan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var PLACES:[JSON]=[]

class SimpleTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel.text="Group \(GID)"
        masterButton.hidden = MASTER ? false:true
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    @IBOutlet weak var masterButton: UIView!
    @IBOutlet weak var displayLabel: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doAThing(sender: AnyObject) {
        Alamofire.request(.POST, "http://ailab.oborot.org:3049/optim", parameters: ["action":"make", "gid":"\(GID)"])
            .responseJSON { response in
                
                if let dataFromString = response.data{
                    let json = JSON(data: dataFromString)
                    // If response is positive
                    print(json)
                    if (json["gid"] != nil){
                        PLACES = json.array!
                        self.performSegueWithIdentifier("optimizePressSegue", sender:nil)
                    }else{
                        self.displayLabel.hidden=false
                    }
                    print(json)
                }
        }
        
        "optimizePressSegue"
    }
    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users?.count ?? 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

            cell.textLabel?.text=users?[indexPath.row]

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

}
