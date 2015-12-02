//
//  StepTableViewCell.swift
//  
//
//  Created by Erik Mudrak on 11/22/15.
//
//

import UIKit

class StepTableViewCell: UITableViewCell {

    @IBOutlet weak var stepImageView: UIImageView!
    @IBOutlet weak var stepLabel: UILabel!
    var stepInformation: String!
    
    //self.stepInformation = steps
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
