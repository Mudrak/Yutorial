//
//  AddChecklistViewController.swift
//  
//
//  Created by admin on 12/6/15.
//
//

import UIKit

class AddChecklistViewController: UIViewController {


    @IBOutlet weak var checklistName: UITextField!
    var name: String = ""
    
    override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool {
        if identifier == "doneSegue" {
            
            // Catches user from entering blank text
            if (checklistName.text.isEmpty) {
                
                let alert = UIAlertView()
                alert.title = "Blank!"
                alert.message = "Enter a title or cancel"
                alert.addButtonWithTitle("Ok")
                alert.show()
                
                return false
            }
                
            else {
                return true
            }
        }
        
        // by default, transition
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "doneSegue" {
            name = checklistName.text
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.checklistName.becomeFirstResponder()
        //checklistName.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // UITextField Delegate:
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if (textField.returnKeyType == UIReturnKeyType.Done){
            self.performSegueWithIdentifier("doneSegue", sender: self)
        }
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
