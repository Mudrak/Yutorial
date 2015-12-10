//
//  Data.swift
//  The Yutorial
//
//  Created by admin on 12/10/15.
//  Copyright (c) 2015 Erik Mudrak. All rights reserved.
//

import Foundation

// Singleton design pattern for supplying same data throughout the app
class Data {
    static let sharedInstance = Data()
    //Usage: Data.sharedInstance
    // Class data for Yutorials, steps, and checklist pages 
    
    init() {
        println("Loading in Singleton")
    }

}
