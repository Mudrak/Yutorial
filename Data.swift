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

class Yutorial {    
    var title: String!
    var steps: [String] = []

    init(title: String) {
        self.title = title
    }   
    
    // Steps: might need to be it's own model, smaller bite-sized parts
    // 3rd VC
    var images: [UIImage] = []
    var checklistItems: [String] = []
    var checked: Bool = false
}
