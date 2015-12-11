//
//  Data.swift
//  The Yutorial
//
//  Created by admin on 12/10/15.
//  Copyright (c) 2015 Erik Mudrak. All rights reserved.
//

import Foundation
import UIKit

// Singleton design pattern for supplying same data throughout the app

class Data {
    static let sharedInstance = Data()
    //Usage: Data.sharedInstance
    
    // Class data for Yutorials, steps, and checklist pages:
    init() {
        println("Loading in Singleton")
    }   
    // All of the data we need saved:
        // 1st VC
        var yutorials: [String] = []
    
        struct StepMenu {
            // 2nd VC
            var steps: [String] = []
            
                // 3rd VC
                var images: [UIImage] = []
                var checklistItems: [String] = []
                var checked: Bool = false
//            init(steps: [String], images: [UIImage], checklistItems: [String], checked: Bool) {
//                self.steps = steps
//                self.images = images
//                self.checklistItems = checklistItems
//                //checked = false
//            }
    }
    // init structs
    var stepMenu = StepMenu()
}
