//
//  Checklist.swift
//  The Yutorial
//
//  Created by admin on 12/14/15.
//  Copyright (c) 2015 Nathan Addison. All rights reserved.
//

import Foundation
import UIKit

class Checklist {
    
    var cellText: String! 
    var checked: Bool
    
    init(cellText: String, checked: Bool) {
        self.cellText = cellText
        self.checked = false 
    }
}