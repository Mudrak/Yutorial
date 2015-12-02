//
//  StepTableViewController.swift
//  
//
//  Created by Erik Mudrak on 11/20/15.
//
//

import UIKit

class StepTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var stepTableView: UITableView!
    
    var steps = [String?]()
    var newStep: String = ""
    var howToLoaded = false
    
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
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // If the first intro cell is selected, fill it with hardcoded data
        if (yutorialInformation == "How To") {
            steps = [
                "Press the '+' add button",
                "Name your Yutorial",
                "Press Done",
                "Name your steps",
                "Make your checklist items for each step",
                "Save & Share",
                "Forget how to do a task, chore, or job? Look back at the Yutorial!"
            ]
        }
        navigationItem.title = yutorialInformation

        // Do any additional setup after loading the view.
    }
    @IBAction func cancel(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func done(segue:UIStoryboardSegue) {
        var addStepVC = segue.sourceViewController as! AddStepViewController
        newStep = addStepVC.name
        
        steps.append(newStep)
        
        self.tableView.reloadData()
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
        return steps.count
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
        cell.stepLabel.text = steps[indexPath.row]
        
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
            
            // Make the first cell different than the user created others
            //stepInfo = [steps[indexPath!.row] : stepImages[indexPath!.row]]
            stepInfo = steps[indexPath!.row]
            
            // Let the new view controller have its info
            upcomingView.stepInformation = stepInfo
            //self.menuTableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
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
