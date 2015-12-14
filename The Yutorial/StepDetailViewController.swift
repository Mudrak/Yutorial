//
//  StepDetailViewController.swift
//  
//
//  Created by Erik Mudrak on 12/1/15.
//
//

import UIKit

class StepDetailViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet var checklistTable: UITableView!
    @IBOutlet weak var stepDetailImage: UIImageView!
    @IBOutlet weak var stepDetailTitle: UILabel!
    
    // Data Manager variables
    var checklistItems = [Checklist]()
    
    var stepInformation: String!
    var stepNumber: UIImage!
    var yutorialTitle: String!
    var newChecklistItem: String = ""
    var i: Int = 0
    var editingCellPath: NSIndexPath?
    
    //Colors: 
    var lightMint = UIColor(red: 78/255, green: 205/255, blue: 184/255, alpha: 1.0)
    var darkMint = UIColor(red: 0.0/255.0, green: 160.0/255.0, blue: 135.0/255.0, alpha: 1.0)
    var white = UIColor.whiteColor()
    
    struct Checkbox {
        var checked: UIImage! = UIImage(named: "check.gray")
        var unchecked: UIImage! = UIImage(named: "check.empty.black")
    }
    let CheckboxImages = Checkbox()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepDetailTitle.text = stepInformation
        stepDetailImage.image = stepNumber
        stepDetailTitle.textColor = UIColor(red: 0.0/255.0, green: 160.0/255.0, blue: 135.0/255.0, alpha: 1.0)
        stepDetailTitle.font = UIFont(name: "Montserrat-Regular", size: 35)
        navigationItem.title = "Step Details"
        
        if (yutorialTitle == "How to Create a Yutorial") {
            checklistItems.append(Checklist(cellText: "Example list of checklist items", checked: false))
            checklistItems.append(Checklist(cellText: "Enter substeps and data here", checked: false))
            checklistItems.append(Checklist(cellText: "From notes to camera roll images", checked: false))
            checklistItems.append(Checklist(cellText: "Add specific info for complex tasks", checked: false))
        }
        navigationItem.title = yutorialTitle
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        // reload data here
        self.checklistTable.reloadData()
    }
    
    // Controls the actions of the Done and Cancel bar button items
    @IBAction func cancel(segue:UIStoryboardSegue) {
        self.dismissViewControllerAnimated(true, completion: {})
        
    }
    
    @IBAction func done(segue:UIStoryboardSegue) {
        var addYutorialVC = segue.sourceViewController as! AddChecklistViewController
        let newChecklistItem = Checklist(cellText: addYutorialVC.name, checked: false)
        
        // Edit, else Add:
        // for Edit: what condition will override the current table row's new text?
        if let selectedIndexPath = editingCellPath where checklistTable.editing {
            checklistItems[selectedIndexPath.row] = newChecklistItem
            editingCellPath = nil
        } else {
            checklistItems.append(newChecklistItem)
        }
        
        self.checklistTable.reloadData()
        
        self.dismissViewControllerAnimated(true, completion: {})
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Only one section necessary
        return checklistItems.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.checklistTable.dequeueReusableCellWithIdentifier("checklistItem") as! checklistCell

        cell.checklistLabel.text = checklistItems[indexPath.row].cellText
        cell.checklistLabel.textColor = UIColor(red: 0.0/255.0, green: 160.0/255.0, blue: 135.0/255.0, alpha: 1.0)
        cell.checklistLabel.font = UIFont(name: "Montserrat-Regular", size: 25)
        cell.checkboxImage.image = CheckboxImages.unchecked
        
        return cell
    }

    // Checklist selection toggling:
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let selectedCell = self.checklistTable.cellForRowAtIndexPath(indexPath) as! checklistCell
        
        println("The state of the checklist item '\(checklistItems[indexPath.row].cellText)' is: \(checklistItems[indexPath.row].checked)")
        
        // The cell is selected: change appearance to selected
        if (selectedCell.backgroundColor == white) {
            checklistItems[indexPath.row].checked = true
            selectedCell.backgroundColor = lightMint
            selectedCell.checklistLabel.textColor = white
            selectedCell.accessoryType = UITableViewCellAccessoryType.Checkmark
            selectedCell.checkboxImage.image = CheckboxImages.checked
            selectedCell.tintColor = white
        } else {
            // Revert back to initial appearance
            checklistItems[indexPath.row].checked = false
            selectedCell.backgroundColor = white
            selectedCell.checklistLabel.textColor = darkMint
            selectedCell.accessoryType = UITableViewCellAccessoryType.None
            selectedCell.checkboxImage.image = CheckboxImages.unchecked
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Edit segue:
        if (segue.identifier == "editYutorial") {
            let addYutorialViewController = segue.destinationViewController as! AddChecklistViewController
            
            // Get the cell that generated this segue.
            if let selectedYutorialCell = sender as? checklistCell {
                let indexPath = self.checklistTable.indexPathForCell(selectedYutorialCell)!
                let selectedYutorial = self.checklistItems[indexPath.row].cellText
                
                // These 3 aren't working?
                addYutorialViewController.checklistName.text = selectedYutorial
                addYutorialViewController.checklistName.placeholder = selectedYutorial
                addYutorialViewController.navigationItem.title = "Edit Step Title"
                
                addYutorialViewController.name = selectedYutorial
            }
        }
            // Go ahead and add stuff
        else if (segue.identifier == "addYutorial"){
            println("Add VC")
        }
    }

    // Override to support conditional editing of the table view.
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // Slide gestures for edit and delete on tableview cells
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        // Slide: Edit the row's text
        let renameButton = UITableViewRowAction(style: .Normal, title: "Rename") { (action, indexPath) in
            self.editingCellPath = indexPath
            self.performSegueWithIdentifier("editYutorial", sender: self)
        }
        let deleteButton = UITableViewRowAction(style: .Default, title: "Delete") { (action, indexPath) in
            self.editingCellPath = indexPath
            self.checklistItems.removeAtIndex(indexPath!.row)
            //let thisYutorial = self.yutorials[indexPath!.row]
            // self.confirmDelete(thisYutorial)
            
            self.checklistTable.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            // remove row from table
            // remove from memory
            // remove from db
            self.editingCellPath = nil
        }
        return [deleteButton, renameButton]
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
