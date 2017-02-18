//
//  AppDelegate.swift
//  RedditReader
//
//  Created by Prashanth Moorthy on 19/07/16.
//  Copyright © 2016 Prashanth Moorthy. All rights reserved.
//

import UIKit
import p2_OAuth2


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var oauth2 : OAuth2CodeGrant!
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        oauth2 = OAuth2CodeGrant(settings: [
            "client_id": "hKzEWqGuyteEUij8ljR39Q",
            "client_secret": "VEHTsajEWQC2R4Kq9yJpYm9ij81yz27Ihv2k73PbNP8JKLPTiP",
            "authorize_uri": "https://api.twitter.com/oauth2/token",
            "token_uri": "https://api.twitter.com/oauth/request_token",
            "scope": "",      // comma-separated, not space-separated scopes!
            "redirect_uris": ["birdland://prash"],   // register scheme in Info.plist
            "parameters": ["grant_type" : "client_credentials"],
            ])
        
//        oauth2 = OAuth2CodeGrant(settings: [
//            "client_id": "G2Qqb3ZJVQJpzw",
//            "client_secret": "",
//            "authorize_uri": "https://www.reddit.com/api/v1/authorize/.compact",
//            "token_uri": "https://www.reddit.com/api/v1/access_token",
//            "scope": "identity,edit,flair,history,mysubreddits,privatemessages,read,report,save,submit,subscribe,vote,wikiedit,wikiread",      // comma-separated, not space-separated scopes!
//            "redirect_uris": ["birdland://prash"],   // register scheme in Info.plist
//            "parameters": ["duration": "permanent"],
//            ])
        
        //modconfig,modflair,modlog,modposts,modwiki,mysubreddits,privatemessages,read,report,save,submit,subscribe,vote,wikiedit,wikiread
        
        application.statusBarStyle = .lightContent
    
        let theStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let theMainFeedVC = theStoryBoard.instantiateViewController(withIdentifier: "MainScreenNavController")
        //let theLeftMenuVC = theStoryBoard.instantiateViewController(withIdentifier: "menuVC")
        
        window?.rootViewController = theMainFeedVC

        
        if let theMainFeedVCNav = theMainFeedVC as? UINavigationController{
            let theTitleFont = UIFont(name: "Avenir", size: 20.0)
            theMainFeedVCNav.navigationBar.titleTextAttributes = [NSFontAttributeName : theTitleFont!]
            theMainFeedVCNav.navigationBar.backgroundColor = UIColor(red: (251.0/255.0), green: (64.0/255.0), blue: (12.0/255.0), alpha: 1.0)
            //theMainFeedVCNav.navigationBar.setBackgroundImage(UIImage(named:"bg header")!, forBarMetrics: .Default)
        }
        
        return true
        
    }
    
    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        print("We have a request to Open Something....  \(url)")
        RedditAuthHandler.sharedAuthHandler.handleRedirectURL(theURL: url)
        
        //        var req = oauth2.request(forURL: url)
        //        var req = oauth2.request(forURL: URL(string: "https://www.reddit.com/hot/.json")!)
        //        var req = oauth2.request(forURL: URL(string: "https://www.reddit.com/api/v1/me/.json")!)
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

