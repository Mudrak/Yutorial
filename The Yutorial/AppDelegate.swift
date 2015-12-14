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
        
        func printFonts() {
            let fontFamilyNames = UIFont.familyNames()
            for familyName in fontFamilyNames {
                println("------------------------------")
                println("Font Family Name = [\(familyName)]")
                let names = UIFont.fontNamesForFamilyName(familyName as! String)
                println("Font Names = [\(names)]")
            }
        }
        // Override point for customization after application launch.
        
        /* MARK: STYLING /////////////////////////////////////////////
        // UI Colors:
        UIColor(red: /255, green: /255, blue: /255, alpha: 1.0)
        
        //      Dark Mint: #00a087
                    UIColor(red: 0.0/255.0, green: 160.0/255.0, blue: 135.0/255.0, alpha: 1.0)
        //      Light Mint: #00bc9e
                    UIColor(red: 0/255, green: 188/255, blue: 158/255, alpha: 1.0)
        //      Faint Mint: #4ECDB8
                    UIColor(red: 78/255, green: 205/255, blue: 184/255, alpha: 1.0)
        //      Yellow: #ffcb46
        //      Ghost White: #f8f8ff
        //      Dark Plum: #502c4d
                    UIColor(red: 80/255, green: 44/255, blue: 77/255, alpha: 1.0)
        //      Flat White: #ecfof1

        */
        
        //let montserrat = UIFont(name: "Montserrat-Regular", size: 20)!
        
        // Navigation bar styling:
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.0/255.0, green: 160.0/255.0, blue: 135.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        
        if let navFont = UIFont(name: "Montserrat-Bold", size: 30) {
            UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: navFont, NSForegroundColorAttributeName: UIColor.whiteColor()]
            println("Nav font loaded")
        } else {
            UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        }

        //UINavigationBar.appearance().font = UIFont(name: "Montserrat-Regular", size: "15")
        //UITextField.appearance().font = montserrat
        if let labelFont = UIFont(name: "Montserrat-Regular", size: 25) {
            UILabel.appearance().font = labelFont
        }
        
        let barButton = UIBarButtonItem.appearance()
        
        if let barButtonFont = UIFont(name: "Montserrat-Regular", size: 22) {
            barButton.setTitleTextAttributes([NSFontAttributeName: barButtonFont], forState: UIControlState.Normal)
        }
        
        //Status Bar color:
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        ///////////////////////////////////
        
        
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

