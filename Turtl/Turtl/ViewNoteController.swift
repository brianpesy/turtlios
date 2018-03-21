/*
 This is a course requirement for CS 192 Software Engineering II
 under the supervisino of Asst. Prof. Ma. Rowena C. Solamo
 of the Department of computer Science, College of Engineering,
 University of the Philippines, Diliman
 for the AY 2017-2018
 
 This code is created by Joan Nicole Balugay.
 
 
 Code History
 Programmer             Date        Description
 Joan Nicole Balugay    02/13/18    Creation, Edited storyboard
 Joan Nicole Balugay    02/17/18    Added saveNote, ViewNoteDelegate, textViewDidBeginEditing, textViewDidChange.
                                    Edited viewWillDisappear
 Joan Nicole Balugay    03/06/18    Added deleteAlert and deleteYes
 
 File Creation Date: 02/13/18
 Development Group: Joan Nicole Balugay, Brian Sy
 Client Group: CS 192
 Purpose of the Software: Note taking application - Turtl

 Reference: https://www.packtpub.com/sites/default/files/downloads/6718OS_Chapter9.pdf. Last accessed: 02/17/18
 */
import UIKit

/* A protocol that notifies the NotesListTableViewController that a change was made and changes the data in the table */
protocol ViewNoteDelegate {
    func editNote(newTitle: String, andBody newBody: String)
    func deleteNote()
}

//var encryptedList = Queue<Array<UInt8>>()
/* Class that handles the ViewNote */
class ViewNoteController: UIViewController, UITextViewDelegate {
    var received = Array<UInt8>()
     /* textBody is used to hold the TextView.
        strTextBody is the textBody treated as a string.
        delegate is used for editNote.
        saveButton is a button used for saving the note.
     */
     @IBOutlet var textBody: UITextView!
     var strTextBody : String!
     var delegate : ViewNoteDelegate?
     @IBOutlet var saveButton: UIBarButtonItem!
     
    @IBOutlet var deleteButton: UIBarButtonItem!
    
     /* saveNote. 02/17/18. This marks the added note as saved.  It first sets the textView to be the first responder to make the keyboard visible.  Then, it checks if the delegate exists.  If it exists, a call to the editNote is made to edit the note with the title and body inputs. */
     @IBAction func saveNote() {
         self.textBody.resignFirstResponder()
         //self.saveButton.tintColor = UIColor.clear
         if self.delegate != nil {
             self.delegate!.editNote(newTitle: self.navigationItem.title!, andBody: self.textBody.text)
         }
     }
    
    
    /* deleteAlert. 03/06/18. This is called when the delete button is pressed.  An alert message is shown to ask the user if they really want to delete the note.  If the user chooses No, nothing happens. If the user chooses Yes, deleteYes is called. */
    @IBAction func deleteAlert() {
        let deleteAlert = UIAlertController(title: "Delete note", message: "Are you sure you want to delete the note?", preferredStyle: UIAlertControllerStyle.alert)
        deleteAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {
            (action: UIAlertAction!) in self.deleteYes()}))
        deleteAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in print("Handle No")}))
        
        present(deleteAlert, animated:true, completion:nil)
        deleteAlert.view.tintColor = UIColor.init(red: CGFloat(130.0/255.0), green: CGFloat(179.0/255.0), blue: CGFloat(96.0/255.0), alpha: CGFloat(1.0))
    }
    
    /* deleteYes. 03/06/18. This is used to call the deleteNote in the NotesListTableViewController. */
    func deleteYes() {
        self.delegate!.deleteNote()
        performSegue(withIdentifier: "notesListSegue", sender: nil)
        
    }
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "notesListSegue"{
            let notesEditor = segue.destination as! ViewNoteController
        }
    }*/
     
     /* viewDidLoad. 02/17/18. This sets the textBody's text to the string strTextBody, makes the textBody the first responder and sets the delegate to self. */
     override func viewDidLoad() {
         super.viewDidLoad()
         
         self.textBody.text = self.strTextBody
         self.textBody.becomeFirstResponder()
         self.textBody.delegate = self         
     }     

     /* didReceiveMemoryWarning. 02/13/18. Dispose of any resources that can be recreated. */
     override func didReceiveMemoryWarning() {
         super.didReceiveMemoryWarning()
     }

     /* viewWillDisappear. 02/17/18. This is called when the Back button is pressed.  This tells NotesListTableViewController that the selected note is updated if the delegate exists. */
     override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
         
         if self.delegate != nil {
             self.delegate!.editNote(newTitle: self.navigationItem.title!, andBody: self.textBody.text)
         }
     }

     /*func textViewDidBeginEditing(_ textView: UITextView) {
          self.saveButton.tintColor = UIColor(red:162.0, green:184.0, blue:148.0, alpha:1.0)
     }*/


     /* textViewDidChange. 02/17/18. This is called when there is a change in the textBody. The textBody is composed of the title and body of the note. The first line is treated as the title and the rest is the body.  This method first seperates the textBody into sections.  Then, this loops through the sections, and sets the first line as the title. */
     func textViewDidChange(_ textView: UITextView) {
         let components = self.textBody.text.components(separatedBy: "\n")
         self.navigationItem.title = ""
         
         for item in components {
             if item.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 {
                 self.navigationItem.title = item
                 break
             }
         }
     
     }
}
