//
//  checklistCell.swift
//  
//
//  Created by admin on 12/5/15.
//
//

import UIKit

class checklistCell: UITableViewCell {

    @IBOutlet weak var checklistLabel: UILabel!
    @IBOutlet weak var checkboxImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
