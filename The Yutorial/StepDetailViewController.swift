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
    var yutorialTitle: String!
    var newChecklistItem: String = ""
    
    //Colors: 
    var lightMint = UIColor(red: 78/255, green: 205/255, blue: 184/255, alpha: 1.0)
    var darkMint = UIColor(red: 0.0/255.0, green: 160.0/255.0, blue: 135.0/255.0, alpha: 1.0)
    var white = UIColor.whiteColor()
    
    var checklistItems: [String!] = []
    
    struct Checkbox {
        var checked: UIImage! = UIImage(named: "check.gray")
        var unchecked: UIImage! = UIImage(named: "check.empty.black")
    }
    let Checkboxes = Checkbox()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepDetailTitle.text = stepInformation
        stepDetailImage.image = stepNumber
        stepDetailTitle.textColor = UIColor(red: 0.0/255.0, green: 160.0/255.0, blue: 135.0/255.0, alpha: 1.0)
        stepDetailTitle.font = UIFont(name: "Montserrat-Regular", size: 35)
        navigationItem.title = "Step Details"
        
        if (yutorialTitle == "How To") {
        checklistItems += ["Example list of checklist items","Enter substeps and data here","From notes to camera roll images","Add specific info for complex tasks"]
        }

        // Do any additional setup after loading the view.
    }
    
    // Add Segue: 
    @IBAction func done(segue:UIStoryboardSegue) {
        var addChecklistVC = segue.sourceViewController as! AddChecklistViewController
        newChecklistItem = addChecklistVC.name
        
        checklistItems.append(newChecklistItem)
        
        self.checklistTable.reloadData()
        
        self.dismissViewControllerAnimated(true, completion: {})
    }
    @IBAction func cancel(segue:UIStoryboardSegue) {
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

        cell.checklistLabel.text = checklistItems[indexPath.row]
        cell.checklistLabel.textColor = UIColor(red: 0.0/255.0, green: 160.0/255.0, blue: 135.0/255.0, alpha: 1.0)
        cell.checklistLabel.font = UIFont(name: "Montserrat-Regular", size: 25)
        cell.checkboxImage.image = Checkboxes.unchecked
        
        return cell
    }

    // Checklist selection toggling:
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let selectedCell = self.checklistTable.cellForRowAtIndexPath(indexPath) as! checklistCell
        
        // The cell is selected: change appearance to selected
        if (selectedCell.backgroundColor == white) {
            selectedCell.backgroundColor = lightMint
            selectedCell.checklistLabel.textColor = white
            selectedCell.accessoryType = UITableViewCellAccessoryType.Checkmark
            selectedCell.checkboxImage.image = Checkboxes.checked
            selectedCell.tintColor = white
        } else {
            // Revert back to initial appearance
            selectedCell.backgroundColor = white
            selectedCell.checklistLabel.textColor = darkMint
            selectedCell.accessoryType = UITableViewCellAccessoryType.None
            selectedCell.checkboxImage.image = Checkboxes.unchecked
        }
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
