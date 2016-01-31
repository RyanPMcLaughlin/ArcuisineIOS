//
//  LoginViewController.swift
//  Arcuisine
//
//  Created by Student on 1/31/16.
//  Copyright © 2016 MikeAndRyan. All rights reserved.
//

import UIKit
import Alamofire

var UID=""

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var loginOutput: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func attemptLogin(sender: AnyObject) {

        let username = self.username.text ?? ""
        let password = self.password.text ?? ""
        
        Alamofire.request(.POST, "http://ailab.oborot.org:3049/login", parameters: ["device":"IOS","email":"\(username)", "password":"\(password)"])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                
                //print(response.data)     // server data
                //print(response.result)   // result of response serialization
                if (String(response.response).containsString("profile")){
                    UID=username
                    self.performSegueWithIdentifier("loginSuccessfulSegue", sender: nil)
                }else{
                    self.loginOutput.text="Invalid Credentials"
                    self.loginOutput.hidden=false
                }
                
            // Also obtain Group ID and store it
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
