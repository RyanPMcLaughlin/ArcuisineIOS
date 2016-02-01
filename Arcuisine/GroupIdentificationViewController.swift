//
//  GroupIdentificationViewController.swift
//  Arcuisine
//
//  Created by Student on 1/31/16.
//  Copyright © 2016 MikeAndRyan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var GID:String = ""

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
        
        let groupID = self.IDField.text ?? ""
        
        // A
        Alamofire.request(.POST, "http://ailab.oborot.org:3049/group", parameters: ["action":"join", "email":"\(UID)", "gid":"\(groupID)"])
            .responseJSON { response in
                
                if let dataFromString = response.data{
                    let json = JSON(data: dataFromString)
                    // If response is positive
                        // Store all of the user data also returned
                        // Call the group user list scene
                    // Else, print an error for no group
                    if (json["users"] != nil){
                        GID = groupID
                        // Store the other fields in a list accessible by other scenes
                        self.performSegueWithIdentifier("IDToUsersSegue", sender:nil)
                    }else{
                        self.displayLabel.text="Invalid Group"
                        self.IDField.text=""
                    }
                }
        }
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
