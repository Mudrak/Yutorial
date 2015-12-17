//
//  StepImage.swift
//  The Yutorial
//
//  Created by admin on 12/16/15.
//  Copyright (c) 2015 Nathan Addison. All rights reserved.
//

import Foundation
import UIKit

class StepImage: NSObject {
    
    var stepImage: UIImage!
    
    init(stepImage: UIImage) {
        self.stepImage = UIImage(named: "yutorials.wordmark")
    }
}