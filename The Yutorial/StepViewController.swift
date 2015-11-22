//
//  StepViewController.swift
//  
//
//  Created by admin on 11/20/15.
//
//

import UIKit

class StepViewController: UITableViewController {

    
    var steps = [String]()
    var newSteps: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        steps = ["Click add button", "Name Yutorial", "Name steps", "Make checklist for each step"]

        // Do any additional setup after loading the view.
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
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("stepCell", forIndexPath: indexPath) as! UITableViewCell
        
        // Configure the cell...
        cell.textLabel!.text = steps[indexPath.row]
        cell.textLabel!.textColor = UIColor(red: 0.0/255.0, green: 160.0/255.0, blue: 135.0/255.0, alpha: 1.0)
        
        return cell
    }
    

    
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
