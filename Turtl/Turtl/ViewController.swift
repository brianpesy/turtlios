//
//  ViewController.swift
//  Turtl
//
//  Created by Brian Sy on 05/02/2018.
//  Copyright © 2018 Brian Sy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var username: UITextField!
    
    @IBOutlet var password: UITextField!
    
//    let name = UserDefaults.standard.string(forKey: "username")
//    usernameLabel.text = "Are you \(name)?"
//
    @IBAction func loginEnter(_ sender: Any) {
        //Verify email, need conditional segue as well
        
        let userLogin = UserDefaults.standard.string(forKey: "username")
        let passwordLogin = UserDefaults.standard.string(forKey: "password")

        if (username.text != "" && password.text != "") || (userLogin != "" && passwordLogin != ""){
            if (username.text != "" || password.text != ""){
                UserDefaults.standard.set(username.text, forKey: "username")
                UserDefaults.standard.set(password.text, forKey: "password")
            }
            
            performSegue(withIdentifier: "loginSegue", sender: self)
        } else {
            errorAlert(title: "Error", message: "Please enter your credentials properly.")
        }
    }

    
    override func viewDidAppear(_ animated: Bool) {
        errorAlert(title: "No Connection", message: "Your data will not be synced to Turtl servers.")
    }
    
    func errorAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

