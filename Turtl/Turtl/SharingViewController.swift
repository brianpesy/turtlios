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

/* SharingViewController handles the methods for the Sharing page in Turtl. */
class SharingViewController: UIViewController {
    
    @IBOutlet var sharingbg: UIImageView!
    
        /*ShareToBoardsButton. 04/12/18. Performs the transition to the boards controller. */
    
    @IBAction func ShareToBoardsButton(_ sender: UIButton) {
        performSegue(withIdentifier: "ShareToBoardsSegue", sender: nil)
    }
    
    /*ShareToNotesButton. 04/12/18. Performs the transition to the notes controller. */

    
    @IBAction func ShareToNotesButton(_ sender: UIButton) {
        performSegue(withIdentifier: "ShareToNotesSegue", sender: nil)
    }
      
    
    /* Do any additional setup after loading the view. */
    override func viewDidLoad(){
        super.viewDidLoad()
       /* navigationItem.hidesBackButton = true
        super.viewDidLoad()
        
        let mainButton:UIBarButtonItem = UIBarButtonItem(title: "All Notes", style: UIBarButtonItemStyle.plain, target: self, action: #selector(SharingViewController.MainButtonTapped(_:)))
        let boardsButton:UIBarButtonItem = UIBarButtonItem(title: "Boards", style: UIBarButtonItemStyle.plain, target: self, action: #selector(SharingViewController.BoardsButtonTapped(_:)))
        let sharingButton:UIBarButtonItem = UIBarButtonItem(title: "Sharing", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        
        mainButton.tintColor = UIColor.init(red: CGFloat(188.0/255.0), green: CGFloat(188.0/255.0), blue: CGFloat(188.0/255.0), alpha: CGFloat(1.0))
        boardsButton.tintColor = UIColor.init(red: CGFloat(188.0/255.0), green: CGFloat(188.0/255.0), blue: CGFloat(188.0/255.0), alpha: CGFloat(1.0))
        sharingButton.tintColor = UIColor.init(red: CGFloat(254.0/255.0), green: CGFloat(254.0/255.0), blue: CGFloat(254.0/255.0), alpha: CGFloat(1.0))
        
        let fixedSpace:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.fixedSpace, target:nil, action:nil)
        fixedSpace.width = 85.0
        self.navigationItem.setLeftBarButtonItems([mainButton,fixedSpace,boardsButton,fixedSpace, sharingButton], animated: true)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.init(red: CGFloat(254.0/255.0), green: CGFloat(254.0/255.0), blue: CGFloat(254.0/255.0), alpha: CGFloat(1.0))]*/
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



