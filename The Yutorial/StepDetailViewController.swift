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
    
    var stepInformation: String!
    var stepNumber: UIImage!
    
    var checklistItems: [String!] = ["List of checklist items", "Enter substeps and data here", "From notes to camera roll images","Add specific info for complex tasks"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepDetailTitle.text = stepInformation
        stepDetailImage.image = stepNumber
        stepDetailTitle.textColor = UIColor(red: 0.0/255.0, green: 160.0/255.0, blue: 135.0/255.0, alpha: 1.0)
        stepDetailTitle.font = UIFont(name: "Montserrat-Regular", size: 35)
        navigationItem.title = "Step Details"

        // Do any additional setup after loading the view.
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

            cell.checklistLabel.text = checklistItems[indexPath.row]
            cell.checklistLabel.textColor = UIColor(red: 0.0/255.0, green: 160.0/255.0, blue: 135.0/255.0, alpha: 1.0)
            cell.checklistLabel.font = UIFont(name: "Montserrat-Regular", size: 25)
        
            let cellPattern = indexPath.row % 2
            // Alternate cell colors
            if (cellPattern == 0) {
                // Color it teal
                cell.checklistLabel.textColor = UIColor.whiteColor()
                cell.backgroundColor = UIColor(red: 0.0/255.0, green: 188.0/255.0, blue: 158.0/255.0, alpha: 1.0)
            }
            else {
                cell.checklistLabel.textColor = UIColor(red: 0.0/255.0, green: 188.0/255.0, blue: 158.0/255.0, alpha: 1.0)
                cell.backgroundColor = UIColor.whiteColor()
            }
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let selectedCell = self.checklistTable.cellForRowAtIndexPath(indexPath) as! checklistCell
        
        selectedCell.backgroundColor = UIColor(red: 78/255, green: 205/255, blue: 184/255, alpha: 1.0)
        selectedCell.checklistLabel.textColor = UIColor.whiteColor()
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
