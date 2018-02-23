/*
 This is a course requirement for CS 192 Software Engineering II
 under the supervisino of Asst. Prof. Ma. Rowena C. Solamo
 of the Department of computer Science, College of Engineering,
 University of the Philippines, Diliman
 for the AY 2017-2018

 This code is created by Brian Sy.

 
Code History
  Programmer   Date       Description
  Brian Sy     01/29/18   Creation, added loginEnter function
  Brian Sy     02/01/18   Added GUI, and errorAlert function
  Brian Sy     02/09/18   Added switchAccounts and refresh functions
  Brian Sy     02/22/18   Bug fixes
  Brian Sy     02/23/18   Fixed toolbar issue, added viewWillAppear and viewWillDisappear
File Creation Date: 01/29/18
Development Group: Joan Nicole Balugay, Brian Sy
Client Group: CS 192
Purpose of the Software: Note taking application - Turtl
 */


import UIKit

class ViewController: UIViewController{
     /*usernameLabel is the label for the username. username holds the data to be read for the login page. password holds the data to be read for the login page. LoggedInUser shows the current logged in user in a label.*/
     @IBOutlet var usernameLabel: UILabel!
     @IBOutlet var username: UITextField!
     @IBOutlet var password: UITextField!
    @IBOutlet var loggedInUser: UILabel!
    
    /* 2/9/18 userLogin and passwordLogin both gets the value inside the key "username" and "password" respectively that was stored in a previous session*/
    
    var userLogin = UserDefaults.standard.string(forKey: "username")
    var passwordLogin = UserDefaults.standard.string(forKey: "password")
    
    
    /* refresh. 2/9/18. This refreshes the UI and makes sure everything is up to date. */
    
    @IBAction func refresh(_ sender: Any) {
        if userLogin == ""{
            loggedInUser.text = "No logged in user."
        } else if userLogin != ""{
            loggedInUser.text = "Welcome \(userLogin!)!"
        }
        
    
    }
    
    /* switchAccounts. 2/9/18. Logs out the user and allows the user to switch accounts */
    
    @IBAction func switchAccounts(_ sender: Any) {
        UserDefaults.standard.set("", forKey: "username")
        userLogin = UserDefaults.standard.string(forKey: "username")
        UserDefaults.standard.set("", forKey: "password")
        passwordLogin = UserDefaults.standard.string(forKey: "password")
        
        loggedInUser.text = "No logged in user."
        
    }
    /* loginEnter. 1/29/18. It logs the user in as the user inputs data inside. This is an action and does not return a value for any future usage.  */
    
     @IBAction func loginEnter(_ sender: Any){
        /* Verify previous session, need conditional segue as well. It will go into the next segue as the button is pressed. userLogin and passwordLogin will retrieve any previous session's username and password to work with.*/

        
        /* Checks if the username text field has information stored inside. If not, then we check for any previous sessions insead */
        
        if (username.text != "" && password.text != "") || (userLogin != "" && passwordLogin != ""){
            if (username.text != "" || password.text != ""){
                UserDefaults.standard.set(username.text, forKey: "username")
                UserDefaults.standard.set(password.text, forKey: "password")
            }
        
            performSegue(withIdentifier: "loginSegue", sender: self)
        }
        else{
            errorAlert(title: "Error", message: "Please enter your credentials properly.")
        }
    }

    /* viewDidAppear. 2/1/18. Makes sure that the alert will appear at the start of the program. Does not return a value to use*/
    
     override func viewDidAppear(_ animated: Bool){
        errorAlert(title: "No Connection", message: "Your data will not be synced to Turtl servers.")
     }
    
     /* errorAlert. 2/1/18. Displays an error when a function goes wrong. Does not return a value to use.*/
     func errorAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
     }
    
    /*viewDidLoad. 1/29/18. Additional setup after loading the view, typically from a nib.*/
    
     override func viewDidLoad(){
        super.viewDidLoad()
     }

     /*didReceiveMemoryWarning. 1/29/18. Dispose of any resources that can be recreated.*/
    
     override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
     }
    
     /*viewWillAppear. 2/23/18. Hiding navigation bar in the controller.*/
    
     override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.navigationController?.setToolbarHidden(true, animated: animated)

     }
     /*viewWillDisappear. 2/23/18. Show the navigation bar on other view controllers*/
     override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.setToolbarHidden(false, animated: false)
     }
}

