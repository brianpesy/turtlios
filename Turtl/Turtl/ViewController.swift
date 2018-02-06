//
//  ViewController.swift
//  Turtl
//
//  Created by Brian Sy on 05/02/2018.
//  Copyright © 2018 Brian Sy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var username: UITextField!
    
    @IBOutlet var password: UITextField!
    
    @IBAction func loginEnter(_ sender: Any) {
        //Verify email, need conditional segue as well
        
        if username.text != "" && password.text != ""{
            
            performSegue(withIdentifier: "loginSegue", sender: self)
        } else {
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        noInternetAlert(title: "No Connection", message: "Your data will not be synced to Turtl servers.")
    }
    
    func noInternetAlert(title:String, message:String){
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

