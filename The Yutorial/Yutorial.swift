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
        if (title == "How to Create a Yutorial") {
            Steps.append(Step(title: "Press the '+' add button"))
            Steps.append(Step(title: "Name your Yutorial"))
            Steps.append(Step(title: "Press Done"))
            Steps.append(Step(title: "Name your steps"))
            Steps.append(Step(title: "Make checklist items for each step"))
            Steps.append(Step(title: "Swipe left to rename and delete"))
            Steps.append(Step(title: "Save & Share"))
            Steps.append(Step(title: "Forget how to do a task, chore, or job? Look back at the Yutorial!"))
        }
    }
    var description: String {
        var s: String
        s = "Yutorial name: \(title) with steps: \(Steps)"
        return s
    }
    
    func append (newStep: Step) {
        Steps.append(newStep)
    }
    
    // Add more about NSCoding! at http://nshipster.com/nscoding/
    
}

