//
//  Yutorial.swift
//  The Yutorial
//
//  Created by admin on 12/10/15.
//  Copyright (c) 2015 Erik Mudrak. All rights reserved.
//

import Foundation
import UIKit

class Yutorial: Printable {
    var title: String!
    var Steps = [Step]()
    
    init(title: String) {
        self.title = title
    }
    var description: String {
        var s: String
        s = "Yutorial name: \(title) with steps: \(Steps)"
        return s
    }
    
    // Add more about NSCoding! at http://nshipster.com/nscoding/
    
}

