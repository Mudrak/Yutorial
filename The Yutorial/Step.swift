//
//  Step.swift
//  The Yutorial
//
//  Created by admin on 12/14/15.
//  Copyright (c) 2015 Nathan Addison. All rights reserved.
//

import Foundation
import UIKit

class Step: Printable {
    
    var title: String
    var ChecklistItems = [Checklist]()
    
    init(title: String) {
        self.title = title
    }
    var description: String {
        var s: String
        s = "Step Name: \(title)"
        return s
    }
}
