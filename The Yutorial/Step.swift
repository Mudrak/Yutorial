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
    
    init(title: String) {
        self.title = title
    }
    override var description: String {
        var s: String
        s = "Step Name: \(title)"
        return s
    }
}
