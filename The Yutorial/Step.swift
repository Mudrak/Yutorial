//
//  Step.swift
//  The Yutorial
//
//  Created by admin on 12/14/15.
//  Copyright (c) 2015 Nathan Addison. All rights reserved.
//

import Foundation
import UIKit

class Step: NSObject, Printable {
    
    var title: String
    var checklistItems = [Checklist]()
    var checklistImage: UIImage!
    
    init(title: String) {
        self.title = title
        
        // Sample Data: based on step title
        if (title == "Find or make a design file") {
            checklistItems = [
                Checklist(cellText: "Use Tinkercad or Blender for personalized designs", checked: false),
                Checklist(cellText: "Browse Thingiverse for other user's designs", checked: false),
                Checklist(cellText: "Send designs to the printer via the Makerbot mobile app, or through Makerware on the Linux and Mac machines", checked: false)
            ]
        }
    }
    override var description: String {
        var s: String
        s = "Step Name: \(title)"
        return s
    }
}
