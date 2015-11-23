//
//  StepViewController.swift
//  
//
//  Created by admin on 11/20/15.
//
//

import UIKit

class StepViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var stepTableView: UITableView!
    
    var steps = [String]()
    var newSteps: String = ""
    
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
        
        steps = [
            "Click add button",
            "Name Yutorial",
            "Name steps",
            "Make checklist for each step",
            "Save & share. You're done!"
        ]
        navigationItem.title = yutorialInformation
        

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
    
//    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String {
//        
//        // Section title, currently showing newest title everywhere
//        /// For custom header, style a new prototype cell: http://www.ioscreator.com/tutorials/customizing-header-footer-table-view-ios8-swift
//        
//        return self.yutorialInformation
//    }
//    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("stepCell", forIndexPath: indexPath) as! StepCellTableViewCell
        
        // Configure the cell...
        cell.stepLabel.text = steps[indexPath.row]
        cell.stepLabel.textColor = UIColor(red: 0.0/255.0, green: 160.0/255.0, blue: 135.0/255.0, alpha: 1.0)
        cell.stepLabel.font = UIFont(name: "Montserrat-Regular", size: 16)
        cell.stepImageView.image = stepImages[indexPath.row]
        
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
