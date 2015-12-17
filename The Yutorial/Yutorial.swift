//
//  Yutorial.swift
//  The Yutorial
//
//  Created by admin on 12/10/15.
//  Copyright (c) 2015 Erik Mudrak. All rights reserved.
//

import Foundation
import UIKit

//final class Yutorial: NSObject, NSCoding, Printable {
class Yutorial: NSObject, Printable {
    
    // File name is a unique id
    //let id: String
    var title: String
    var steps: [Step] = []
    
    // read serial
    // load all yutorials - class method
    // save for each one - instance method
    // looping through the collection - extra
    // inherit from NSObject to use NSCoding
    
    init(title: String) {
        //id = NSUUID().UUIDString
        self.title = title
        if (title == "How to Create a Yutorial") {
            steps.append(Step(title: "Press the '+' add button"))
            steps.append(Step(title: "Name your Yutorial"))
            steps.append(Step(title: "Press Done"))
            steps.append(Step(title: "Name your steps"))
            steps.append(Step(title: "Make checklist items for each step"))
            steps.append(Step(title: "Swipe left to rename and delete"))
            steps.append(Step(title: "Save & Share"))
            steps.append(Step(title: "Forget how to do a task, chore, or job? Look back at the Yutorial!"))
        }
        if (title == "Setting up the stereo"){
            steps.append(Step(title: "Select the desired input to connect to speakers (CD, DVD, HDMI)"))
            steps.append(Step(title: "Connect RCA (red + white) cables to the input on back of the receiver"))
            steps.append(Step(title: "Find opposite end of cables"))
            steps.append(Step(title: "Connect those to your output device (TV, computer)"))
            steps.append(Step(title: "Cut and strip speaker wire"))
            steps.append(Step(title: "For each speaker, hook end A to the speaker and end B to the receiver"))
            steps.append(Step(title: "Power on the receiver, set the input, and test"))
        }
        if (title == "How to tie a tie") {
            steps.append(Step(title: "Start with the wide end ('W') of your necktie on the right, extending about 12 inches below the narrow end ('N') on the left."))
            steps.append(Step(title: "Then cross the wide end over the narrow end."))
            steps.append(Step(title: "Bring the wide end up through the loop between the collar and your tie."))
            steps.append(Step(title: "Then bring the wide end back down."))
            steps.append(Step(title: "Pull the wide end underneath the narrow end and to the right, back through the loop and to the right again so that the wide end is inside out."))
            steps.append(Step(title: "Bring the wide end across the front from right to left."))
            steps.append(Step(title: "Then pull the wide end up through the loop again."))
            steps.append(Step(title: "Bring the wide end down through the knot in front."))
            steps.append(Step(title: "And -- using both hands -- tighten the knot carefully and draw it up to the collar."))
        }
    }
    override var description: String {
        var s: String
        s = "Yutorial name: \(title) with steps: \(steps)"
        return s
    }
    
    // MARK: NSCoding
    
//    init(coder decoder: NSCoder) {
//        if let id = decoder.decodeObjectForKey("id") as? String {
//            self.id = id
//        } else {
//            id = NSUUID().UUIDString
//        }
//        if let title = decoder.decodeObjectForKey("title") as? String {
//            self.title = title
//        } else {
//            title = ""
//        }
//        if let steps = decoder.decodeObjectForKey("steps") as? [Step] {
//            self.steps = steps
//        } else {
//            steps = []
//        }
//    }
//
//    func encodeWithCoder(coder: NSCoder) {
//        coder.encodeObject(self.id, forKey: "id")
//        coder.encodeObject(self.title, forKey: "title")
//        coder.encodeObject(self.steps, forKey: "steps")
//    }
//    
//    // Call in VC's to save new objects
//    func save() {
//        Yutorial.encode(self)
//    }
//    func delete () {
//        Yutorial.deleteFromPath(storagePath)
//    }
//    
//    // MARK: - Class level encoding functions
//    
//    class func all() -> [Yutorial] {
//        return decodeAllFromPath(storagePath)
//    }
//    
//    class func deleteFromPath(path: String) {
//        // delete from db
//        NSFileManager.defaultManager().removeItemAtPath(path, error: nil)
//    }
//    
//    class func encode(yutorial: Yutorial) -> Bool {
//        let path = yutorial.storagePath
//        let ok = NSKeyedArchiver.archiveRootObject(yutorial, toFile: path)
//        if !ok { print("Failed to save to \(path). \(yutorial)") }
//        return ok
//    }
//    
//    class func decodeFromPath(path: String) -> Yutorial {
//        if let loaded: AnyObject? = NSKeyedUnarchiver.unarchiveObjectWithFile(path) {
//            return (loaded as? Yutorial)!
//        } else {
//            return Yutorial(title: "nil!")
//        }
//    }
//    
//    class func decodeAllFromPath(path: String) -> [Yutorial] {
//        // if crashes, add an error pointer
//        if let files = NSFileManager.defaultManager().contentsOfDirectoryAtPath(path, error: nil) {
//            return map(files, { (x: AnyObject) -> Yutorial in
//                return self.decodeFromPath("\(path)/\(x)")
//            })
//        } else {
//            return []
//        }
//    }
//    
//    var storagePath: String {
//        return Yutorial.storagePath + "/" + id
//    }
//    
//    static var storagePath = (NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
//        NSSearchPathDomainMask.UserDomainMask, true).first! as! String) + "Yutorials"
//    
//    class func initializeStorage() {
//        NSFileManager.defaultManager().createDirectoryAtPath(storagePath, withIntermediateDirectories: true, attributes: nil, error: nil)
//    }
}