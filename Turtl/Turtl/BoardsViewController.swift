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
  Brian Sy             04/12/18    Added segue to notes and share

File Creation Date: 01/30/18
Development Group: Joan Nicole Balugay, Brian Sy
Client Group: CS 192
Purpose of the Software: Note taking application - Turtl
 */

import UIKit

/* BoardsViewController handles the methods for the Boards page in Turtl. */
class BoardsViewController: UIViewController{
    
    @IBOutlet var boardsbg: UIImageView!
    
    /*BoardsToNotesButton. 04/12/18. Performs the transition to the notes controller. */
    
    @IBAction func BoardsToNotesButton(_ sender: UIButton) {
        //BoardsToNotesSegue
        performSegue(withIdentifier: "BoardsToNotesSegue", sender: nil)
    }
    
        /*BoardsToShareButton. 04/12/18. Performs the transition to the share controller. */
    
    @IBAction func BoardsToShareButton(_ sender: UIButton) {
    //BoardsToShareSegue
        performSegue(withIdentifier: "BoardsToShareSegue", sender: nil)
    }
    
    /* Do any additional setup after loading the view. */
     override func viewDidLoad(){
        super.viewDidLoad()
     }
     /* Dispose of any resources that can be recreated. */
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



