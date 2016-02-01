//
//  GroupActionViewController.swift
//  Arcuisine
//
//  Created by Student on 1/31/16.
//  Copyright © 2016 MikeAndRyan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class GroupActionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var displayLabel: UILabel!
    @IBAction func makeGroupPressed(sender: AnyObject) {
        Alamofire.request(.POST, "http://ailab.oborot.org:3049/group", parameters: ["action":"make", "email":"\(UID)"])
            .responseJSON { response in
                
                if let dataFromString = response.data{
                    let json = JSON(data: dataFromString)
                    // If response is positive

                    if (json["gid"] != nil){
                        GID = json["success"].string ?? ""
                        // Store the other fields in a list accessible by other scenes
                        self.performSegueWithIdentifier("makeGroupSegue", sender:nil)
                    }else{
                        self.displayLabel.hidden=false
                    }
                    print(json)
                }
        }    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
