/*
 This is a course requirement for CS 192 Software Engineering II
 under the supervisino of Asst. Prof. Ma. Rowena C. Solamo
 of the Department of computer Science, College of Engineering,
 University of the Philippines, Diliman
 for the AY 2017-2018
 
 This code is created by Joan Nicole Balugay and Brian Sy.
 
 
 Code History
 Programmer             Date       Description
 Joan Nicole Balugay    02/13/18   Creation, Edited storyboard
 Joan Nicole Balugay    02/17/18   Added addNote, tableView, editNote, saveNotes, prepare
                                   Edited viewDidLoad, viewDidAppear
 
 File Creation Date: 02/13/18
 Development Group: Joan Nicole Balugay, Brian Sy
 Client Group: CS 192
 Purpose of the Software: Note taking application - Turtl

 Reference: https://www.packtpub.com/sites/default/files/downloads/6718OS_Chapter9.pdf. Last accessed: 02/17/18
 */

import UIKit

/* Class that handles the NotesList */
class NotesListTableViewController: UITableViewController, ViewNoteDelegate {
    
    /* notesArr is a dictionary used to store the notes.
       index is used for the index of the notes. */
    var notesArr = [[String:String]]()
    var index = -1
    
    /* addNote. 02/17/18. This is called when the add button is pressed.  This creates a new instance of the note, adds the note to the top of the dictionary, reloads the table, transtions to the ViewNoteController, and saves the note. */
    @IBAction func addNote() {
        
        let newNote = ["title" : "", "body":""]
        notesArr.insert(newNote, at: 0)
        self.index = 0
        self.tableView.reloadData()
        performSegue(withIdentifier: "editorSegue", sender: nil)
        saveNotes()
    }
    
    /* viewDidLoad. 02/17/18.  This customizes the navigation bar and checks if there are existing notes in the phone, this stores the notes in the notesArr. */
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
    
    /*override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }*/
    
    /* didReceiveMemoryWarning. 02/13/18. Dispose of any resources that can be recreated. */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    /* tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int. 02/17/18.  This returns the number of rows in the section which is the number of notes in the  dictionary. */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArr.count
    }

    /* tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell. 02/17/18.  This grabs the selected note from the dictionary, sets the title of the note, and returns the note. */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath)
        note.textLabel!.text = notesArr[indexPath.row]["title"]

        return note
    }
    
    /* tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath). 02/17/18.  This is called when a note is selected.  This will transition to the ViewNoteController of the selected note. */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.index = indexPath.row
        performSegue(withIdentifier: "editorSegue", sender: nil)
    }
    
    /* prepare(for segue: UIStoryboardSegue, sender: Any?). 02/17/18.  This sets the ViewNoteController as the next transition.  This also sets the title in the navigation bar as the title of the selected note. */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let notesEditor = segue.destination as! ViewNoteController
        
        notesEditor.navigationItem.title = notesArr[self.index]["title"]
        notesEditor.strTextBody = notesArr[self.index]["body"]
        notesEditor.delegate = self
    }
    
    /* editNote(newTitle: String, andBody newBody: String). 02/17/18. This is used to update the table when there are changes in a note.  This gets two strings as the title and body of the note. Then, this sets the title and body of a note to the inputs, updates the table, and saves the notes. */
    func editNote(newTitle: String, andBody newBody: String) {
        self.notesArr[self.index]["title"] = newTitle
        self.notesArr[self.index]["body"] = newBody
        
        self.tableView.reloadData()
        saveNotes()
        
        //Delete after adding tba
    }
    
    /* saveNotes. 02/17/18. This saves the notes dictionary in the phone. */
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
