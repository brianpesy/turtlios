/*
 This is a course requirement for CS 192 Software Engineering II
 under the supervisino of Asst. Prof. Ma. Rowena C. Solamo
 of the Department of computer Science, College of Engineering,
 University of the Philippines, Diliman
 for the AY 2017-2018
 
 This code is created by Joan Nicole Balugay.
 
 
 Code History
 Programmer              Date       Description
 Joan Nicole Balugay     03/22/18   Creation, edited viewDidLoad
 
 File Creation Date: 03/22/18
 Development Group: Joan Nicole Balugay, Brian Sy
 Client Group: CS 192
 Purpose of the Software: Note taking application - Turtl
 */
import UIKit

class BoardsListTableViewController: UITableViewController {
    
    @objc func MainButtonTapped(_ sender: UIBarButtonItem!) {
        performSegue(withIdentifier: "BoardsToNotesSegue", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainButton:UIBarButtonItem = UIBarButtonItem(title: "All Notes", style: UIBarButtonItemStyle.plain, target: self, action: #selector(BoardsListTableViewController.MainButtonTapped(_:)))
        let boardsButton:UIBarButtonItem = UIBarButtonItem(title: "Boards", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        let sharingButton:UIBarButtonItem = UIBarButtonItem(title: "Sharing", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        
        mainButton.tintColor = UIColor.init(red: CGFloat(188.0/255.0), green: CGFloat(188.0/255.0), blue: CGFloat(188.0/255.0), alpha: CGFloat(1.0))
        boardsButton.tintColor = UIColor.init(red: CGFloat(188.0/255.0), green: CGFloat(188.0/255.0), blue: CGFloat(188.0/255.0), alpha: CGFloat(1.0))
        sharingButton.tintColor = UIColor.init(red: CGFloat(254.0/255.0), green: CGFloat(254.0/255.0), blue: CGFloat(254.0/255.0), alpha: CGFloat(1.0))
        
        let fixedSpace:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.fixedSpace, target:nil, action:nil)
        fixedSpace.width = 85.0
        self.navigationItem.setLeftBarButtonItems([mainButton,fixedSpace,boardsButton,fixedSpace, sharingButton], animated: true)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.init(red: CGFloat(254.0/255.0), green: CGFloat(254.0/255.0), blue: CGFloat(254.0/255.0), alpha: CGFloat(1.0))]
      
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
}
