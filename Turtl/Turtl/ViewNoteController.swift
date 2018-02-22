/*
 This is a course requirement for CS 192 Software Engineering II
 under the supervisino of Asst. Prof. Ma. Rowena C. Solamo
 of the Department of computer Science, College of Engineering,
 University of the Philippines, Diliman
 for the AY 2017-2018
 
 This code is created by Joan Nicole Balugay and Brian Sy.
 
 
 Code History
 Programmer             Date        Description
 Joan Nicole Balugay    02/13/18    Creation, Edited viewDidLoad,
 Joan Nicole Balugay    02/16/18
 
 File Creation Date: 01/29/118
 Development Group: Joan Nicole Balugay, Brian Sy
 Client Group: CS 192
 Purpose of the Software: Note taking application - Turtl
 */
import UIKit

protocol ViewNoteDelegate {
    func editNote(newTitle: String, andBody newBody: String)
}


class ViewNoteController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var textBody: UITextView!
    var strTextBody : String!
    var delegate : ViewNoteDelegate?
    @IBOutlet var saveButton: UIBarButtonItem!
    
    @IBAction func saveNote() {
        self.textBody.resignFirstResponder()
        //self.saveButton.tintColor = UIColor.clear
        if self.delegate != nil {
            self.delegate!.editNote(newTitle: self.navigationItem.title!, andBody: self.textBody.text)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textBody.text = self.strTextBody
        self.textBody.becomeFirstResponder()
        self.textBody.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.delegate != nil {
            self.delegate!.editNote(newTitle: self.navigationItem.title!, andBody: self.textBody.text)
        }
    }
  
    /*func textViewDidBeginEditing(_ textView: UITextView) {
         self.saveButton.tintColor = UIColor(red:162.0, green:184.0, blue:148.0, alpha:1.0)
    }*/

    func textViewDidChange(_ textView: UITextView) {
        let components = self.textBody.text.components(separatedBy: "\n")
        self.navigationItem.title = ""
        
        for item in components {
            if item.trimmingCharacters(in: .whitespacesAndNewlines).characters.count > 0 {
                self.navigationItem.title = item
                break
            }
        }
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
