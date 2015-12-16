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
    let id: String = NSUUID().UUIDString
    var title: String
    var steps: [Step] = []
    
    // read serial
    // load all yutorials - class method
    // save for each one - instance method
    // looping through the collection - extra
    // inherit from NSObject to use NSCoding
    
    init(title: String) {
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
    
    func append (newStep: Step) {
        steps.append(newStep)
    }

    init(coder decoder: NSCoder) {
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
        coder.encodeObject(self.title, forKey: "title")
        coder.encodeObject(self.steps, forKey: "steps")
    }
    
    
    //MARK: NSCoding

//    let CodedStorage<P: _Persistable where P: NSObject>: PersistenceType
//    var cache = Dictionary<P.ID, P>()
//    
//    init() {
//        initializeStorage()
//    }
//    
//    func persist(entity: P) -> Bool {
//        guard let id = entity.id else { return false }
//        let path = pathForID(String(id))
//        return encode(entity, toPath: path)
//    }
//    
//    func fetch(id: P.ID) -> P? {
//        if let e = cache[id] {
//            return e
//        }
//        cache[id] = decodeFromPath(pathForID(String(id)))
//        return cache[id]
//    }
//    
//    func fetchAll(reload: Bool = false) -> [P] {
//        if reload || cache.isEmpty {
//            return decodeAllFromPath(self.storagePath)
//        } else {
//            return Array(cache.values)
//        }
//    }
//    
//    func encode(entity: P, toPath path: String) -> Bool {
//        let ok = NSKeyedArchiver.archiveRootObject(entity, toFile: path)
//        if !ok { print("Failed to save \(P.self) to path \(path). \(entity)") }
//        return ok
//    }
//    
//    func decodeFromPath(path: String) -> P? {
//        return NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? P
//    }
//    
//    func decodeAllFromPath(path: String) -> [P] {
//        do {
//        let files = try NSFileManager.defaultManager().contentsOfDirectoryAtPath(path)
//        return files.flatMap { decodeFromPath("\(path)/\($0)") }
//        } catch let error as NSError {
//            print("Error: \(error.domain) - Could not read contents of directory \(path)")
//            return [Persistable]()
//        }
//    }
//    
//    var storageRoot = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
//        NSSearchPathDomainMask.UserDomainMask, true).first! + "/persistence"
//    
//    var storagePath: String { return storageRoot + String(Persistable) }
//    
//    func pathForID(id: String) -> String {
//        return storagePath + "/" + id
//    }
//    
//    private func initializeStorage() {
//        try! NSFileManager.defaultManager().createDirectoryAtPath(storagePath, withIntermediateDirectories: true, attributes: nil)
//    }
    
}

