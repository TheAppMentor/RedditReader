//
//  RedditAuthHandler.swift
//  RedditReader
//
//  Created by Moorthy, Prashanth on 11/21/16.
//  Copyright © 2016 Prashanth Moorthy. All rights reserved.
//

import Foundation
import p2_OAuth2

class RedditAuthHandler : AuthHandler {
    
    static let sharedAuthHandler : RedditAuthHandler = RedditAuthHandler()
    
    var authorizeContext : AnyObject?
    
    public func authorizeUser() -> (accessToken : String?, error : AuthErrorCode?){
        
        
    return (nil,nil)
    }
    
    func signOutUser() -> AuthErrorCode?{
        oauth2.forgetTokens()
        return nil
    }
    
    func handleRedirectURL(theURL : URL){
        oauth2.handleRedirectURL(theURL)
    }
    
    
    private func fetchUseInformation() -> [String:AnyObject?]{
        var returnDict = [String:AnyObject]()

        // Fetch User Information :
        
        //https://oauth.reddit.com/api/me/?raw_json=1
        
        var reqUserInfo = self.oauth2.request(forURL: URL(string : "https://oauth.reddit.com//api/v1/me/?raw_json=1")!)
        reqUserInfo.setValue("bearer \(self.oauth2.accessToken!)", forHTTPHeaderField: "Authorization")
        
        let loaderUser = OAuth2DataLoader(oauth2: self.oauth2)
        
        loaderUser.perform(request: reqUserInfo) { response in
            do {
                let dict = try response.responseJSON()
                DispatchQueue.main.async {
                    // you have received `dict` JSON data!
                    print("We Got the User Information")
                    returnDict = dict as [String:AnyObject]
                    print("The User Name is \(returnDict["name"])")
                }
            }
            catch let error {
                DispatchQueue.main.async {
                    // an error occurred
                    print("Error !!!!! : Unable to fetch the data ---> \(error.localizedDescription) \(error.asOAuth2Error.description)")
                }
            }
        }

        return returnDict
    }
    
    func fetchJSONForURL(theURL : URL, completionHandler : @escaping (_ result : [String : AnyObject]?) -> ()){
        
        var returnDict = [String:AnyObject]()
        
            self.authorizeUserPrivate(completionHandler: {
                
                // Fetch User Information :
                
                let userInfo = self.fetchUseInformation()
                
                var req = self.oauth2.request(forURL: theURL)
                
                req.setValue("bearer \(self.oauth2.accessToken!)", forHTTPHeaderField: "Authorization")
                print("Request Value is : ........................ \(req.value(forHTTPHeaderField: "Authorization"))")
                
                let loader = OAuth2DataLoader(oauth2: self.oauth2)
                
                loader.perform(request: req) { response in
                    do {
                        let dict = try response.responseJSON()
                        DispatchQueue.main.async {
                            // you have received `dict` JSON data!
                            print("We Got the Final Result")
                            returnDict = dict as [String:AnyObject]
                            completionHandler(returnDict)
                        }
                    }
                    catch let error {
                        DispatchQueue.main.async {
                            // an error occurred
                            print("Error !!!!! : Unable to fetch the data ---> \(error.localizedDescription) \(error.asOAuth2Error.description)")
                        }
                    }
                }
            })
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // Private functions/Properties.
    
    private let redditAppID = "G2Qqb3ZJVQJpzw"
    
    private var privateOauth : OAuth2CodeGrant?
    
    private var oauth2 : OAuth2CodeGrant {
        
        if privateOauth == nil{
            privateOauth = OAuth2CodeGrant(settings: [
                "client_id": redditAppID,
                "client_secret": "",
                "authorize_uri": "https://www.reddit.com/api/v1/authorize/.compact",
                "token_uri": "https://www.reddit.com/api/v1/access_token",
                "scope": "identity,edit,flair,history,mysubreddits,privatemessages,read,report,save,submit,subscribe,vote,wikiedit,wikiread",      // comma-separated, not space-separated scopes!
                "redirect_uris": ["birdland://prash"],   // register scheme in Info.plist
                "parameters": ["duration": "permanent"],
                ])
        }
        
        return privateOauth!
        
    }
    
    private init() {}
    
    private func authorizeUserPrivate(completionHandler : @escaping () -> ()){
        
        if oauth2.isAuthorizing{
            print("Authorization is already in progress.......")
            return
        }
        
        if oauth2.hasUnexpiredAccessToken() {
            print("Using the Un Expired Token.. old one...")
            print("The user name is \(oauth2.clientName)")
            completionHandler()
        } else{
            // Required to show the safari VC.. in the app.. instead of launching Safari Separately.
            oauth2.authConfig.authorizeEmbedded = true
            oauth2.authConfig.authorizeContext = authorizeContext
            
            oauth2.authorize() { authParameters, error in
                if let _ = authParameters {
                    print("Authorized! Access token is in \(self.oauth2.accessToken)")
                    print("Authorized! Access token is in \(self.oauth2.scope)")
                    completionHandler()
                }
                else {
                    print("Authorization was cancelled or went wrong: \(error)")   // error will not be nil
                }
            }
        }
    }
}



//var req = oauth2.request(forURL: URL(string: ("https://oauth.reddit.com/api/me/?raw_json=1"))!)
//var req = oauth2.request(forURL: URL(string: ("https://oauth.reddit.com/api/v1/me/karma/?raw_json=1"))!)
//var req = oauth2.request(forURL: URL(string: ("https://oauth.reddit.com/api/v1/me/prefs/?raw_json=1"))!)
//var req = oauth2.request(forURL: URL(string: ("https://oauth.reddit.com/api/user/me/comments/?raw_json=1"))!)
//var req = oauth2.request(forURL: URL(string: ("https://oauth.reddit.com/r/funny/about"))!)
