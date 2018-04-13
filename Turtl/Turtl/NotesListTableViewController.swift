/*
 This is a course requirement for CS 192 Software Engineering II
 under the supervisino of Asst. Prof. Ma. Rowena C. Solamo
 of the Department of computer Science, College of Engineering,
 University of the Philippines, Diliman
 for the AY 2017-2018
 
 This code is created by Joan Nicole Balugay.
 
 
 Code History
 Programmer             Date       Description
 Joan Nicole Balugay    02/13/18   Creation, Edited storyboard
 Joan Nicole Balugay    02/17/18   Added addNote, tableView, editNote, saveNotes, prepare
 Edited viewDidLoad, viewDidAppear
 Brian Sy               02/23/18   Added logout button. Edited prepare function
 Brian Sy               03/05/18   Added Rabbit encryption and RNG for 128 bits and 64 bits.
 Joan Nicole Balugay    03/06/18   Added deleteNote and edited editNote
 Brian Sy               03/16/18   Edited editNote, saveNote, deleteNote for synchronization process, and
 Brian Sy               03/23/18   synchronizeNote added for future implementation
 Joan Nicole Balugay    04/11/18   Added share and board segue from the notes page.
 
 
 File Creation Date: 02/13/18
 Development Group: Joan Nicole Balugay, Brian Sy
 Client Group: CS 192
 Purpose of the Software: Note taking application - Turtl
 
 Reference: https://www.packtpub.com/sites/default/files/downloads/6718OS_Chapter9.pdf. Last accessed: 02/17/18
 */

import UIKit
import CryptoSwift

/* Extends the array to return the item if the item in the index exists or return nil if it doesn't exist. */
extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

public struct Queue<T> {
    
    // 2
    var list = [T]()
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    // 3
    public mutating func enqueue(_ element: T) {
        list.append(element)
    }
    
    // 4
    public mutating func dequeue() -> T? {
        if !list.isEmpty {
            return list.removeFirst()
        } else {
            return nil
        }
    }
    
    // 5
    public func peek() -> T? {
        if !list.isEmpty {
            return list[0]
        } else {
            return nil
        }
    }
}

/*Necessary variables for synchronization */

var toPass = Array<UInt8>()
var toSync  = [Array<UInt8>?](repeating: nil, count:100)
var doneSync: [Int] = []
var doneSyncCtr = 0
var univOldBody = ""


/* Class that handles the NotesList */
class NotesListTableViewController: UITableViewController, ViewNoteDelegate {
    
    /*generateRandomNumber128 3/5/2018. Used for generating a 128 bit number. */
    func generateRandomNumber128() -> String{
        var i = 0
        var key = ""
        while(i < 16){
            var randomNumber = String(arc4random_uniform(10))
            key = key + randomNumber
            i = i + 1
        }
        return key
    }
    
    /*generateRandomNumber64 3/5/2018. Used for generating a 64 bit number. */
    
    func generateRandomNumber64() -> String{
        var i = 0
        var key = ""
        while(i < 8){
            var randomNumber = String(arc4random_uniform(10))
            key = key + randomNumber
            i = i + 1
        }
        return key
    }
    
    /*synchronizeNote 3/23/18. This is the function to synchronize the note to the server. It needs to be able to take in toSync and then synchronize it with Turtl's servers.*/
    func synchronizeNote(syncArray: Array<UInt8>){
        
    }
    
    
    /*logOutButton 2/23/2018. Button used for logging out*/
    @IBAction func logOutButton(_ sender: Any) {
        performSegue(withIdentifier: "logOutSegue", sender: self)
        
    }
    /* notesArr is an array used to store the notes.
     index is used for the index of the notes. */
    var notesArr = [[String:String]]()
    var index = -1
    
    
    /* addNote. 02/17/18. This is called when the add button is pressed.  This creates a new instance of the note, adds the note to the top of the array, reloads the table, transtions to the ViewNoteController, and saves the note. */
    @IBAction func addNote() {
        var newNote = ["title" : "", "body":"", "key":"", "iv":""]
        notesArr.insert(newNote, at: 0)
        self.index = 0
        self.tableView.reloadData()
        performSegue(withIdentifier: "editorSegue", sender: nil)
        saveNotes()
    }
    
    /*BoardsButtonTapped. 04/12/18. Performs the transition to the boards controller. */

    
    @objc func BoardsButtonTapped(_ sender: UIBarButtonItem!) {
        performSegue(withIdentifier: "NotesToBoardsSegue", sender: nil)
    }
    
    /*ShareButtonTapped. 04/12/18. Performs the transition to the share controller. */

    
    @objc func ShareButtonTapped(_ sender: UIBarButtonItem!) {
        performSegue(withIdentifier: "NotesToShareSegue", sender: nil)
    }
    

    
    /* viewDidLoad. 02/17/18.  This customizes the navigation bar and checks if there are existing notes in the phone, this stores the notes in the notesArr. */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainButton:UIBarButtonItem = UIBarButtonItem(title: "All Notes", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        let boardsButton:UIBarButtonItem = UIBarButtonItem(title: "Boards", style: UIBarButtonItemStyle.plain, target: self, action: #selector(NotesListTableViewController.BoardsButtonTapped(_:)))
        let sharingButton:UIBarButtonItem = UIBarButtonItem(title: "Sharing", style: UIBarButtonItemStyle.plain, target: self, action: #selector(NotesListTableViewController.ShareButtonTapped(_:)))
        
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
        tableView.tableFooterView = UIView()
    }
    
    /*override func viewDidAppear(_ animated: Bool) {
     super.viewDidAppear(animated)
     }*/
    
    /* didReceiveMemoryWarning. 02/13/18. Dispose of any resources that can be recreated. */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    /* tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int. 02/17/18.  This returns the number of rows in the section which is the number of notes in the  array. */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArr.count
    }
    
    /* tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell. 02/17/18.  This grabs the selected note from the array, sets the title of the note, and returns the note. */
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
        if segue.identifier == "editorSegue"{
            let notesEditor = segue.destination as! ViewNoteController
            notesEditor.navigationItem.title = notesArr[self.index]["title"]
            notesEditor.strTextBody = notesArr[self.index]["body"]
            notesEditor.delegate = self
            
            var syncController = segue.destination as! ViewNoteController
            syncController.received = toPass
        }
        else if segue.identifier == "logOutSegue"{
            
        }
        else if segue.identifier == "NotesToBoardsSegue" {
            
        }
        
        
        
    }
    
    /* editNote(newTitle: String, andBody newBody: String). 02/17/18. This is used to update the table when there are changes in a note.  This gets two strings as the title and body of the note. Then, this sets the title and body of a note to the inputs, updates the table, and saves the notes. As the editNote function happens, keys are generated. The key is constant per note and the IV is always changing. After which, it goes into encryption. Otherwise, it catches the error in encryption. Here, for the synchronization proper (need Turtl's actual servers for this one but is currently unavailable for iOS) happens as well most notably a data structure that holds notes to be synchronized*/
    func editNote(newTitle: String, andBody newBody: String) {
        if self.notesArr[safe: self.index] != nil {
            var oldBody = self.notesArr[self.index]["body"]
            univOldBody = oldBody!
            self.notesArr[self.index]["title"] = newTitle
            self.notesArr[self.index]["body"] = newBody
            if self.notesArr[self.index]["key"] == "" {
                self.notesArr[self.index]["key"] = generateRandomNumber128()
            }
            self.notesArr[self.index]["iv"] = generateRandomNumber64()
            print(notesArr)
            
            if(self.notesArr[self.index]["title"] == "") {
                self.notesArr.remove(at: self.index)
            }
            var message = " " + self.notesArr[self.index]["body"]!
            
            do {
                let encrypted = try Rabbit(key: self.notesArr[self.index]["key"]!, iv: self.notesArr[self.index]["iv"]!).encrypt(Array(message.utf8))
                print(encrypted)
                
                if self.notesArr[self.index]["body"] == oldBody{
                    
                    if doneSync.contains(self.index){
                        print("test")
                    }
                    else if !doneSync.contains(self.index){
                        
                        doneSync.append(self.index)
                        if let i = doneSync.index(of: self.index){
                            
                            toSync[i] = encrypted
                        }
                    }
                }
                else {
                    print("The test wasn't quite the same")
                    if oldBody == ""{
                        toSync[notesArr.count-1] = encrypted
                        
                    }
                    else if let i = doneSync.index(of: self.index){
                        toSync[i] = encrypted
                    }
                    
                }
                print(toSync)
                
            } catch {
                print("Error in the encryption process")
            }
            
            self.tableView.reloadData()
            saveNotes()
        }
    }
    
    /* saveNotes. 02/17/18. This saves the notes array in the phone. */
    func saveNotes() {
        UserDefaults.standard.set(notesArr, forKey: "notes")
        UserDefaults.standard.synchronize()
    }
    
    /* deleteNote. 03/06/18. This deletes a note in the array, reloads the table data, and saves the remaining notes. */
    func deleteNote() {
        self.notesArr.remove(at: self.index)
        self.tableView.reloadData()
        
        print(univOldBody)
        if univOldBody == ""{
            toSync[notesArr.count] = nil
        }
        else if let i = doneSync.index(of: self.index){
            toSync[i] = nil
            doneSync[i] = 9999999
        }
        print(toSync)
        
        saveNotes()
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

