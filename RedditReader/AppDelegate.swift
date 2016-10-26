//
//  AppDelegate.swift
//  RedditReader
//
//  Created by Prashanth Moorthy on 19/07/16.
//  Copyright © 2016 Prashanth Moorthy. All rights reserved.
//

import UIKit
import DrawerController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        application.statusBarStyle = .lightContent
    
        let theStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let theMainFeedVC = theStoryBoard.instantiateViewController(withIdentifier: "MainScreenNavController")
        let theLeftMenuVC = theStoryBoard.instantiateViewController(withIdentifier: "menuVC")
        
        let theDrawerController = DrawerController(centerViewController: theMainFeedVC, leftDrawerViewController: theLeftMenuVC)
        theDrawerController.openDrawerGestureModeMask = .All
        theDrawerController.closeDrawerGestureModeMask = .All
        
        window?.rootViewController = theDrawerController
        
        if let theMainFeedVCNav = theMainFeedVC as? UINavigationController{
            let theTitleFont = UIFont(name: "Avenir", size: 20.0)
            theMainFeedVCNav.navigationBar.titleTextAttributes = [NSFontAttributeName : theTitleFont!]
            theMainFeedVCNav.navigationBar.backgroundColor = UIColor(red: (251.0/255.0), green: (64.0/255.0), blue: (12.0/255.0), alpha: 1.0)
            //theMainFeedVCNav.navigationBar.setBackgroundImage(UIImage(named:"bg header")!, forBarMetrics: .Default)
        }
            
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

