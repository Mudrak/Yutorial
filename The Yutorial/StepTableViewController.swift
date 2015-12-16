//
//  StepTableViewController.swift
//  
//
//  Created by Erik Mudrak on 11/20/15.
//
//

import UIKit

protocol YutorialMenuVCDelegate {
    func updateData(data: [Step])
}

class StepTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var stepTableView: UITableView!
    
    var yutorial: Yutorial!
    var newStep: String = ""
    var howToLoaded = false
    var editingCellPath: NSIndexPath?
    
    var yutorialInformation: String!
    
    // Load in array of step images
    var stepImages: [UIImage] = [
        UIImage(named: "step1")!,
        UIImage(named: "step2")!,
        UIImage(named: "step3")!,
        UIImage(named: "step4")!,
        UIImage(named: "step5")!,
        UIImage(named: "step6")!,
        UIImage(named: "step7")!,
        UIImage(named: "step8")!,
        UIImage(named: "step9")!,
        UIImage(named: "step10")!,
        UIImage(named: "step11")!,
        UIImage(named: "step12")!,
        UIImage(named: "step13")!,
        UIImage(named: "step14")!,
        UIImage(named: "step15")!,
        UIImage(named: "step16")!,
        UIImage(named: "step17")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = yutorialInformation
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        // reload data here
        //self.stepTableView.reloadData()
    
        println("Appear--Contents of yutorial.steps: \(yutorial.steps)")
    }
    
    // Controls the actions of the Done and Cancel bar button items
    @IBAction func cancel(segue:UIStoryboardSegue) {
        self.dismissViewControllerAnimated(true, completion: {})
        
    }
    
    @IBAction func done(segue:UIStoryboardSegue) {
        var addYutorialVC = segue.sourceViewController as! AddStepViewController
        let newStep = Step(title: addYutorialVC.name)
        
        // Edit, else Add:
        // for Edit: what condition will override the current table row's new text?
        if let selectedIndexPath = editingCellPath where stepTableView.editing {
            self.yutorial.steps[selectedIndexPath.row] = newStep
            editingCellPath = nil
        } else {
            self.yutorial.steps.append(newStep)
        }
        
//        self.delegate?.updateData(self.data)
        self.tableView.reloadData()
        
        self.dismissViewControllerAnimated(true, completion: {})
    }
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
        return yutorial.steps.count
    }
    
//    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String {
//        
//        // Section title, currently showing newest title everywhere
//        /// For custom header, style a new prototype cell: http://www.ioscreator.com/tutorials/customizing-header-footer-table-view-ios8-swift
//        
//        return self.yutorialInformation
//    }
//    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("stepCell", forIndexPath: indexPath) as! StepTableViewCell
//        let newCell = tableView.dequeueReusableCellWithIdentifier("newStepCell", forIndexPath: indexPath) as! StepTableViewCell
        
        // Configure the cell...
        
        cell.stepLabel.textColor = UIColor(red: 0.0/255.0, green: 160.0/255.0, blue: 135.0/255.0, alpha: 1.0)
        cell.stepLabel.font = UIFont(name: "Montserrat-Regular", size: 25)
        cell.stepImageView.image = stepImages[indexPath.row]
        cell.stepLabel.text = self.yutorial.steps[indexPath.row].title
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showDetails") {
            // For segue to the checklist tableview
            // upcomingView is set to ChecklistViewController
            var upcomingView: StepDetailViewController = segue.destinationViewController as! StepDetailViewController
            
            // indexPath is set to the selected path
            let indexPath = self.stepTableView.indexPathForSelectedRow()
            
            //var stepInfo: [String: UIImage]
            var stepInfo: String!
            var stepNum: UIImage!
            var indexToPass: Int!
            
            // Make the first cell different than the user created others
            //stepInfo = [yutorial.steps[indexPath!.row] : stepImages[indexPath!.row]]
            stepInfo = self.yutorial.steps[indexPath!.row].title
            stepNum = stepImages[indexPath!.row]
            
            // Let the new view controller have its info
            upcomingView.navigationItem.backBarButtonItem?.title = "yutorial.steps"
            upcomingView.stepInformation = stepInfo
            upcomingView.stepNumber = stepNum
            upcomingView.yutorialTitle = yutorialInformation
            upcomingView.step = yutorial.steps[indexPath!.row]
            //self.stepTableView.deselectRowAtIndexPath(indexPath!, animated: true)
        }
            // Edit segue:
        if (segue.identifier == "editYutorial"){
            let addYutorialViewController = segue.destinationViewController as! AddStepViewController
            
            addYutorialViewController.navigationItem.title = "Edit Step Title"
            
            // Get the cell that generated this segue.
            if let selectedYutorialCell = sender as? StepTableViewCell {
                let indexPath = self.stepTableView.indexPathForCell(selectedYutorialCell)!
                let selectedYutorial = self.yutorial.steps[indexPath.row].title
                // These 3 aren't working?
                addYutorialViewController.stepName.text = selectedYutorial
                addYutorialViewController.stepName.placeholder = selectedYutorial
                addYutorialViewController.title = "Edit Step"
            
                // navigationItem.title = "Edit Step Title"
                
                addYutorialViewController.name = selectedYutorial
            }
        }
            // Go ahead and add stuff
        else if (segue.identifier == "addYutorial"){
            let addYutorialViewController = segue.destinationViewController as! AddStepViewController
            addYutorialViewController.title = "Add Step"
            
            println("Add VC")
        }
    }
    
    
    // MARK: Editing and Deleting
    
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
            self.yutorial.steps.removeAtIndex(indexPath!.row)
            //let thisYutorial = self.yutorials[indexPath!.row]
            // self.confirmDelete(thisYutorial)
            
            self.stepTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            // remove row from table
            // remove from memory
            // remove from db
            self.editingCellPath = nil
        }
        return [deleteButton, renameButton]
    }
    
    // Dynamic cells for user-entered step data

//    func viewControllerAtIndex(index: Int) -> StepViewController {
//        
//        if((self.pageTableViews.count == 0) || (index >= self.pageTableViews.count)) {
//            
//            return StepViewController()
//        }
    
//        var vc: StepViewController = self.storyboard?.instantiateViewControllerWithIdentifier("") as! StepViewController
    
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
