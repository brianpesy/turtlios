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
        //Verify email
        
        if (username.text != nil) {
            
        } else {
            
        }
        
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

