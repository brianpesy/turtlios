/*
 This is a course requirement for CS 192 Software Engineering II
 under the supervisino of Asst. Prof. Ma. Rowena C. Solamo
 of the Department of computer Science, College of Engineering,
 University of the Philippines, Diliman
 for the AY 2017-2018
 
 This code is created by Joan Nicole Balugay and Brian Sy.
 
 
 Code History
 Programmer           Date       Description
 Brian Sy             01/29/18   Creation
 Joan Nicole Balugay  01/29/18   Creation
 
 File Creation Date: 01/29/118
 Development Group: Joan Nicole Balugay, Brian Sy
 Client Group: CS 192
 Purpose of the Software: Note taking application - Turtl
 */

import UIKit

class NotesListTableViewController: UITableViewController, ViewNoteDelegate {

    var notesArr = [[String:String]]()
    var index = -1
    
    @IBAction func addNote() {
        
        let newNote = ["title" : "", "body":""]
        notesArr.insert(newNote, at: 0)
        self.index = 0
        self.tableView.reloadData()
        performSegue(withIdentifier: "editorSegue", sender: nil)
        saveNotes()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainButton:UIBarButtonItem = UIBarButtonItem(title: "All Notes", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        let boardsButton:UIBarButtonItem = UIBarButtonItem(title: "Boards", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        
        let sharingButton:UIBarButtonItem = UIBarButtonItem(title: "Sharing", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        
        mainButton.tintColor = UIColor.init(red: CGFloat(254.0/255.0), green: CGFloat(254.0/255.0), blue: CGFloat(254.0/255.0), alpha: CGFloat(1.0))
        boardsButton.tintColor = UIColor.init(red: CGFloat(188.0/255.0), green: CGFloat(188.0/255.0), blue: CGFloat(188.0/255.0), alpha: CGFloat(1.0))
        sharingButton.tintColor = UIColor.init(red: CGFloat(188.0/255.0), green: CGFloat(188.0/255.0), blue: CGFloat(188.0/255.0), alpha: CGFloat(1.0))
        
        let fixedSpace:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.fixedSpace, target:nil, action:nil)
        fixedSpace.width = 85.0
        self.navigationItem.setLeftBarButtonItems([mainButton,fixedSpace,boardsButton,fixedSpace, sharingButton], animated: true)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.init(red: CGFloat(254.0/255.0), green: CGFloat(254.0/255.0), blue: CGFloat(254.0/255.0), alpha: CGFloat(1.0))]
        
        if let prevNotes = UserDefaults.standard.array(forKey: "notes") as? [[String:String]] {
            notesArr = prevNotes
        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let height: CGFloat = 100
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x:0, y:0, width: bounds.width, height:bounds.height + height)
    }
    
/*    @objc func goToBoards() {
        performSegue(withIdentifier: "boardsSegue", sender: nil)
    }
    @objc func goToSharing() {
        performSegue(withIdentifier: "sharingSegue", sender: nil)    }
*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // Return number of rows in the section
        return notesArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath)
        note.textLabel!.text = notesArr[indexPath.row]["title"]

        return note
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.index = indexPath.row
        performSegue(withIdentifier: "editorSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let notesEditor = segue.destination as! ViewNoteController
        
        notesEditor.navigationItem.title = notesArr[self.index]["title"]
        notesEditor.strTextBody = notesArr[self.index]["body"]
        notesEditor.delegate = self
    }
    

    func editNote(newTitle: String, andBody newBody: String) {
        self.notesArr[self.index]["title"] = newTitle
        self.notesArr[self.index]["body"] = newBody
        
        self.tableView.reloadData()
        saveNotes()
        
        //Delete after adding tba
    }
    
    func saveNotes() {
        UserDefaults.standard.set(notesArr, forKey: "notes")
        UserDefaults.standard.synchronize()
        
    }
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
