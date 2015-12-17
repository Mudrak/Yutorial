//
//  Yutorial.swift
//  The Yutorial
//
//  Created by admin on 12/10/15.
//  Copyright (c) 2015 Erik Mudrak. All rights reserved.
//

import Foundation
import UIKit

final class Yutorial: NSObject, NSCoding, Printable {
    
    // File name is a unique id
    let id: String
    var title: String
    var steps: [Step] = []
    
    // read serial
    // load all yutorials - class method
    // save for each one - instance method
    // looping through the collection - extra
    // inherit from NSObject to use NSCoding
    
    init(title: String) {
        id = NSUUID().UUIDString
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
    }
    override var description: String {
        var s: String
        s = "Yutorial name: \(title) with steps: \(steps)"
        return s
    }
    
    // MARK: NSCoding
    
    init(coder decoder: NSCoder) {
        if let id = decoder.decodeObjectForKey("id") as? String {
            self.id = id
        } else {
            id = NSUUID().UUIDString
        }
        if let title = decoder.decodeObjectForKey("title") as? String {
            self.title = title
        } else {
            title = ""
        }
        if let steps = decoder.decodeObjectForKey("steps") as? [Step] {
            self.steps = steps
        } else {
            steps = []
        }
    }

    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.id, forKey: "id")
        coder.encodeObject(self.title, forKey: "title")
        coder.encodeObject(self.steps, forKey: "steps")
    }
    
    // Call in VC's to save new objects
    func save() {
        Yutorial.encode(self)
    }
    func delete () {
        Yutorial.deleteFromPath(storagePath)
    }
    
    // MARK: - Class level encoding functions
    
    class func all() -> [Yutorial] {
        return decodeAllFromPath(storagePath)
    }
    
    class func deleteFromPath(path: String) {
        // delete from db
        NSFileManager.defaultManager().removeItemAtPath(path, error: nil)
    }
    
    class func encode(yutorial: Yutorial) -> Bool {
        let path = yutorial.storagePath
        let ok = NSKeyedArchiver.archiveRootObject(yutorial, toFile: path)
        if !ok { print("Failed to save to \(path). \(yutorial)") }
        return ok
    }
    
    class func decodeFromPath(path: String) -> Yutorial {
        if let loaded: AnyObject? = NSKeyedUnarchiver.unarchiveObjectWithFile(path) {
            return (loaded as? Yutorial)!
        } else {
            return Yutorial(title: "nil!")
        }
    }
    
    class func decodeAllFromPath(path: String) -> [Yutorial] {
        // if crashes, add an error pointer
        if let files = NSFileManager.defaultManager().contentsOfDirectoryAtPath(path, error: nil) {
            return map(files, { (x: AnyObject) -> Yutorial in
                return self.decodeFromPath("\(path)/\(x)")
            })
        } else {
            return []
        }
    }
    
    var storagePath: String {
        return Yutorial.storagePath + "/" + id
    }
    
    static var storagePath = (NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
        NSSearchPathDomainMask.UserDomainMask, true).first! as! String) + "Yutorials"
    
    class func initializeStorage() {
        NSFileManager.defaultManager().createDirectoryAtPath(storagePath, withIntermediateDirectories: true, attributes: nil, error: nil)
    }
}