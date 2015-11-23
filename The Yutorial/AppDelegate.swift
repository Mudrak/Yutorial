//
//  AppDelegate.swift
//  The Yutorial
//
//  Created by Nathan Addison on 12/31/14.
//  Copyright (c) 2014 Nathan Addison. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
  
        // UI Colors:
        //      Dark Mint: #00a087
        //      Light Mint: #00bc9e
        //      Yellow: #ffcb46
        //      Ghost White: #f8f8ff
        //      Dark Plum: #502c4d
        //      Flat White: #ecfof1
        
        let montserrat = UIFont(name: "Montserrat-Regular", size: 20)!
        
        // Navigation bar styling:
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.0/255.0, green: 160.0/255.0, blue: 135.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        
        let attrs = [
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : UIFont(name: "Montserrat-Bold", size: 30)!
        ]
        UINavigationBar.appearance().titleTextAttributes = attrs

        //UINavigationBar.appearance().font = UIFont(name: "Montserrat-Regular", size: "15")
        
        //Status Bar color:
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        
        // Table Views
        // UITableViewCell.appearance().textLabel!.font = UIFont(name: "Montserrat-Regular", size: 16)!
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

