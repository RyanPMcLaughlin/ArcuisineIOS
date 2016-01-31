//
//  GroupIdentificationViewController.swift
//  Arcuisine
//
//  Created by Student on 1/31/16.
//  Copyright © 2016 MikeAndRyan. All rights reserved.
//

import UIKit

class GroupIdentificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var IDField: UITextField!
    @IBAction func joinPressed(sender: AnyObject) {
        // This should A) send cur group clear
        // B join the new group if matched
        // C Move on to the next page... Query the data too?
        
        // A
        
        // B
        let groupID = self.IDField.text ?? ""
        
        print("Group: \(groupID), User: \(UID)")
        
        // if error, display error on displayLabel
        // C
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
