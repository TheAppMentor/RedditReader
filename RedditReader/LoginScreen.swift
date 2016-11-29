//
//  LoginScreen.swift
//  RedditReader
//
//  Created by Moorthy, Prashanth on 11/17/16.
//  Copyright © 2016 Prashanth Moorthy. All rights reserved.
//

import UIKit
import p2_OAuth2

class LoginScreen: UIViewController {

    var oauth2 : OAuth2CodeGrant! {
     return (UIApplication.shared.delegate as? AppDelegate)?.oauth2
    }

    
    @IBAction func loginOAuth(_ sender: Any) {
        
        if oauth2.isAuthorizing{
            print("Authorization is already in progress.......")
            return
        }
        
        print("Login Function Called.... \(oauth2)")
        
        // Required to show the safari VC.. in the app.. instead of launching Safari Separately.
        oauth2.authConfig.authorizeEmbedded = true
        oauth2.authConfig.authorizeContext = self
        
        oauth2.authorize() { authParameters, error in
            if let params = authParameters {
                print("Authorized! Access token is in \(self.oauth2?.accessToken)")
                print("Authorized! Additional parameters: \(params)")
            }
            else {
                print("Authorization was cancelled or went wrong: \(error)")   // error will not be nil
            }
        }
    }
    
    @IBAction func logoutOAuth(_ sender: UIButton) {
       oauth2.forgetTokens()
    }
    
    @IBAction func GoToReddit(_ sender: Any) {
        
//        let theEnum = RedditAPIHandler.read_new
        let theEnum = RedditAPIHandler.history_user_username_comments

        RedditAuthHandler.sharedAuthHandler.authorizeContext = self
        
        theEnum.fetchData(sender: self) {(theResponse) in
            print("Login Screen : We have now fetched the data .................. ")
            self.theDataToPass = theResponse
            self.performSegue(withIdentifier: "gotoRedditPage", sender: nil)
        }
    }
    
    var theDataToPass = [String:AnyObject?]()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let theFeedListVC = segue.destination as? FeedPageTableViewController{
            theFeedListVC.storyList = RedditFetcher.sharedFetcher.jsonParser(theDataToPass)
        }
    }
    
}
