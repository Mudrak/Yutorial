//
//  AddYutorialViewController.swift
//  
//
//  Created by Nathan Addison on 11/19/15.
//
//

import UIKit

class AddYutorialViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var yutorialName: UITextField!
    var name: String = ""
    
    override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool {
        if identifier == "doneSegue" {
            
            if (yutorialName.text.isEmpty) {
                
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "doneSegue") {
            name = yutorialName.text
        }
    }
    @IBAction func cancel(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func done(segue:UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Makes cursor start in textField
        self.yutorialName.becomeFirstResponder()
<<<<<<< HEAD
        yutorialName.delegate = self
=======
>>>>>>> master

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UITextField Delegate:
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
<<<<<<< HEAD
        if (textField.returnKeyType == UIReturnKeyType.Done){
            self.performSegueWithIdentifier("doneSegue", sender: self)
        }
        return true
    }
    

=======
        return true
    }
>>>>>>> master
    //yutorialName.delegate = self

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
