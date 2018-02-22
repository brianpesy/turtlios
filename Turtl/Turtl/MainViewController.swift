/*
 This is a course requirement for CS 192 Software Engineering II
 under the supervisino of Asst. Prof. Ma. Rowena C. Solamo
 of the Department of computer Science, College of Engineering,
 University of the Philippines, Diliman
 for the AY 2017-2018.
 
 This code is created by Joan Nicole Balugay.
 
 Code History
  Programmer           Date        Description
  Joan Nicole Balugay  01/30/18    Creation, Added GUI
  Joan Nicole Balugay  02/01/18    Finished GUI
 
 File Creation Date: 01/30/18
 Development Group: Joan Nicole Balugay, Brian Sy
 Client Group: CS 192
 Purpose of the Software: Note taking application - Turtl
 */

import UIKit

/* MainViewController handles the methods for the Main page in Turtl. */
class MainViewController: UIViewController {
    
     @IBOutlet var main: UIImageView!
     @IBOutlet var boardsButton: UIButton!
     @IBOutlet var sharingButton: UIButton!
    
    
    /* Do any additional setup after loading the view. */
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    /* Dispose of any resources that can be recreated. */
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
}
