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
//        oauth2.abortAuthorization()
    }
    
    @IBAction func GoToReddit(_ sender: Any) {
        
        ///api/v1/me/trophies
        
        //var req = oauth2.request(forURL: URL(string: ("https://oauth.reddit.com/api/me/?raw_json=1"))!)
        //var req = oauth2.request(forURL: URL(string: ("https://oauth.reddit.com/api/v1/me/karma/?raw_json=1"))!)
        //var req = oauth2.request(forURL: URL(string: ("https://oauth.reddit.com/api/v1/me/prefs/?raw_json=1"))!)
        //var req = oauth2.request(forURL: URL(string: ("https://oauth.reddit.com/api/user/me/comments/?raw_json=1"))!)
        //var req = oauth2.request(forURL: URL(string: ("https://oauth.reddit.com/r/funny/about"))!)
        var req = oauth2.request(forURL: URL(string: ("https://oauth.reddit.com/user/username/comments"))!)
        
        ///user/username/comments
        
        //"/r/subreddit/about"
        
        req.setValue("bearer \(oauth2.accessToken!)", forHTTPHeaderField: "Authorization")
        print("Request Value is : ........................ \(req.value(forHTTPHeaderField: "Authorization"))")
        
        let loader = OAuth2DataLoader(oauth2: oauth2)
        
        loader.perform(request: req) { response in
            do {
                let dict = try response.responseJSON()
                DispatchQueue.main.async {
                    // you have received `dict` JSON data!
                    print("We Got the Final Result")
                    print("The Details are \(dict)")
                }
            }
            catch let error {
                DispatchQueue.main.async {
                    // an error occurred
                    print("Error !!!!! : Unable to fetch the data ---> \(error.localizedDescription) \(error.asOAuth2Error.description)")
                }
            }
        }
        //performSegue(withIdentifier: "gotoRedditPage", sender: self)
    }
    
    
    
}
