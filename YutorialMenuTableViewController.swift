//
//  YutorialMenuTableViewController.swift
//
//
//  Created by Nathan Addison on 11/19/15.
//
//

import UIKit

class YutorialMenuTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
//    enum Segues: String {
//        case EditYutorial = "editYutorial"
//    }
    
    @IBOutlet weak var menuTableView: UITableView!
    
    var yutorials = [Yutorial]()
    
    // Use for NSCoder:
    //var yutorials = Yutorial.all()
    
    var newYutorials: String = ""
    var editingCellPath: NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sample Yutorials
        yutorials = [
            Yutorial(title: "How to Create a Yutorial"),
            Yutorial(title: "Setting up the stereo"),
            Yutorial(title: "How to tie a tie")
        ]
    }
    override func viewDidAppear(animated: Bool) {
        // reload data here
        self.menuTableView.reloadData()
    }
    override func viewDidDisappear(animated: Bool) {
        // save here? How? 
    }
    
    @IBAction func cancel(segue:UIStoryboardSegue) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    @IBAction func done(segue:UIStoryboardSegue) {
        var addYutorialVC = segue.sourceViewController as! AddYutorialViewController
        let newYutorial = Yutorial(title: addYutorialVC.name)
        
        // Edit, else Add:
        // for Edit: what condition will override the current table row's new text?
        if let selectedIndexPath = editingCellPath where menuTableView.editing {
            //save:
            //yutorials[selectedIndexPath.row].save()
            yutorials[selectedIndexPath.row] = newYutorial
            editingCellPath = nil
        } else {
            // Add the Yutorial
            yutorials.append(newYutorial)
        }
        //let indexPath = self.menuTableView.indexPathForSelectedRow()
        self.menuTableView.reloadData()
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
       // @IBAction

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return yutorials.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("yutorialCell", forIndexPath: indexPath) as!
            YutorialMenuTableViewCell
    
        // Configure the cell...
        cell.yutorialLabel.textColor = UIColor(red: 0.0/255.0, green: 160.0/255.0, blue: 135.0/255.0, alpha: 1.0)
        cell.yutorialLabel.font = UIFont(name: "Montserrat-Regular", size: 25)
        cell.yutorialLabel.text = yutorials[indexPath.row].title
        
        // Save the cell being created...
        //yutorials[indexPath.row].save()

        return cell
    }
    
    // MARK: Delegate function - navigation stuff:
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showSteps") {
            
            // upcomingView is set to StepTableViewController
            var upcomingView: StepTableViewController = segue.destinationViewController as! StepTableViewController
            
//            (segue.destinationViewController as! StepTableViewController).delegate = self
            
            // indexPath is set to the selected path
            let indexPath = self.menuTableView.indexPathForSelectedRow()
            
            var yutorialInfo: String!
            
            // Make the first cell different than the user created others
            if (indexPath!.row == 0) {
                yutorialInfo = yutorials[0].title
            }
            else {
                yutorialInfo = yutorials[indexPath!.row].title
            }
            //yutorials[indexPath!.row].save()
            // Let the new view controller have its info
            upcomingView.yutorialInformation = yutorialInfo
            upcomingView.yutorial = yutorials[indexPath!.row]
            
            //self.menuTableView.deselectRowAtIndexPath(indexPath!, animated: true)
        }
        // Edit segue:
        if (segue.identifier == "editYutorial"){
            let addYutorialViewController: AddYutorialViewController = segue.destinationViewController as! AddYutorialViewController
            
            // Get the cell that generated this segue.
            if let selectedYutorialCell = sender as? YutorialMenuTableViewCell {
                let indexPath = self.menuTableView.indexPathForCell(selectedYutorialCell)!
                let selectedYutorial = self.yutorials[indexPath.row].title
                
                // Not displaying? Issues with optionals?
                addYutorialViewController.yutorialName.text = selectedYutorial
                addYutorialViewController.yutorialName.placeholder = selectedYutorial
                addYutorialViewController.navigationItem.title = "Edit Yutorial Title"
                addYutorialViewController.title = "Edit Yutorial Title"
                
                addYutorialViewController.name = selectedYutorial
            }
        }
        // Go ahead and add stuff
        else if (segue.identifier == "addYutorial"){
        }
    }
    
    
    //MARK: Editing and Deleting 

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    // Slide gestures for edit and delete on tableview cells
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        // Slide: Edit the row's text
        let renameButton = UITableViewRowAction(style: .Normal, title: "Rename") { (action, indexPath) in
            self.editingCellPath = indexPath
            self.performSegueWithIdentifier("editYutorial", sender: self)
        }
        let deleteButton = UITableViewRowAction(style: .Default, title: "Delete") { (action, indexPath) in
            self.editingCellPath = indexPath
            // delete from db:
            //self.yutorials[indexPath!.row].delete()
            // delete from table
            self.yutorials.removeAtIndex(indexPath!.row)
            // delete from db:
            //let thisYutorial = self.yutorials[indexPath!.row]
            // self.confirmDelete(thisYutorial)

            self.menuTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            // remove row from table
            // remove from memory 
            // remove from db
            self.editingCellPath = nil
        }
        return [deleteButton, renameButton]
    }
    
    // MARK: Delete Confirmation stuff is all commented out, but most of it is here:
    //
    //    var deleteRowIndexPath: NSIndexPath? = nil
    //
    //    func handleDeleteRow(alertAction: UIAlertAction!) -> Void {
    //        if let indexPath = deleteRowIndexPath {
    //            tableView.beginUpdates()
    //
    //            self.yutorials.removeAtIndex(indexPath.row)
    //
    //            // Note that indexPath is wrapped in an array:  [indexPath]
    //            menuTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    //
    //            deleteRowIndexPath = nil
    //
    //            menuTableView.endUpdates()
    //        }
    //    }
    //
    //    func cancelDeleteRow(alertAction: UIAlertAction!) {
    //        deleteRowIndexPath = nil
    //    }
    //
    //    func confirmDelete(title: String) {
    //        let alert = UIAlertController(title: "Delete?", message: "Are you sure you want to permanently delete \(title)?", preferredStyle: .ActionSheet)
    //
    //        let DeleteAction = UIAlertAction(title: "Delete", style: .Destructive, handler:handleDeleteRow)
    //        let CancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler:cancelDeleteRow)
    //
    //        alert.addAction(DeleteAction)
    //        alert.addAction(CancelAction)
    //
    //        // Support display in iPad
    //        alert.popoverPresentationController?.sourceView = self.view
    //        alert.popoverPresentationController?.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0)
    //        
    //        self.presentViewController(alert, animated: true, completion: nil)
    //    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */


}
