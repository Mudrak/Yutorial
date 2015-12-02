//
//  YutorialMenuTableViewController.swift
//
//
//  Created by Nathan Addison on 11/19/15.
//
//

import UIKit

class YutorialMenuTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    var yutorials = [String]()
    var newYutorials: String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yutorials = ["How to Create A Yutorial"]
        
    }
        @IBAction func cancel(segue:UIStoryboardSegue) {
            
        }
        
        @IBAction func done(segue:UIStoryboardSegue) {
            var addYutorialVC = segue.sourceViewController as! AddYutorialViewController
            newYutorials = addYutorialVC.name
            
            yutorials.append(newYutorials)
            
            self.tableView.reloadData()
        }
        

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
        cell.yutorialLabel.text = self.yutorials[indexPath.row]

        return cell
    }
    
    //// Delegate function - navigation stuff:
//    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        self.performSegueWithIdentifier("showSteps", sender: self)
//    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showSteps") {
            
            // upcomingView is set to BansheeDetailViewController
            var upcomingView: StepTableViewController = segue.destinationViewController as! StepTableViewController
            
            // indexPath is set to the selected path
            let indexPath = self.menuTableView.indexPathForSelectedRow()
            
            var yutorialInfo: String!
            
            // Make the first cell different than the user created others
            if (indexPath!.row == 0) {
                yutorialInfo = "How To"
            }
            else {
                yutorialInfo = yutorials[indexPath!.row]
            }
            
            // Let the new view controller have its info
            upcomingView.yutorialInformation = yutorialInfo
            //self.menuTableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
