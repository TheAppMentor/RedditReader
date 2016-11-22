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
    
    func fetchJSONForURL() -> [String:AnyObject]{
        
        var returnDict = [String:AnyObject]()
        
        
        if oauth2.hasUnexpiredAccessToken() == false{
            self.authorizeUserPrivate()
        }
        
        if oauth2.hasUnexpiredAccessToken(){
            ///api/v1/me/trophies
            
            //var req = oauth2.request(forURL: URL(string: ("https://oauth.reddit.com/api/me/?raw_json=1"))!)
            //var req = oauth2.request(forURL: URL(string: ("https://oauth.reddit.com/api/v1/me/karma/?raw_json=1"))!)
            //var req = oauth2.request(forURL: URL(string: ("https://oauth.reddit.com/api/v1/me/prefs/?raw_json=1"))!)
            //var req = oauth2.request(forURL: URL(string: ("https://oauth.reddit.com/api/user/me/comments/?raw_json=1"))!)
            //var req = oauth2.request(forURL: URL(string: ("https://oauth.reddit.com/r/funny/about"))!)
            var req = oauth2.request(forURL: URL(string: ("https://oauth.reddit.com/user/username/comments"))!)
            
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
                        returnDict = dict as [String:AnyObject]
                    }
                }
                catch let error {
                    DispatchQueue.main.async {
                        // an error occurred
                        print("Error !!!!! : Unable to fetch the data ---> \(error.localizedDescription) \(error.asOAuth2Error.description)")
                    }
                }
            }
        }
        
        return returnDict
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
    
    private func authorizeUserPrivate() -> (accessToken : String?, error : AuthErrorCode?){
        
        var authCode : String?
        var theError : AuthErrorCode?
        
        if oauth2.isAuthorizing{
            print("Authorization is already in progress.......")
            theError = AuthErrorCode.authorizationAlreadyInProgress
            return(authCode,theError)
        }
        
        // Required to show the safari VC.. in the app.. instead of launching Safari Separately.
        oauth2.authConfig.authorizeEmbedded = true
        oauth2.authConfig.authorizeContext = authorizeContext
        
        oauth2.authorize() { authParameters, error in
            if let _ = authParameters {
                print("Authorized! Access token is in \(self.oauth2.accessToken)")
                authCode = self.oauth2.accessToken
            }
            else {
                print("Authorization was cancelled or went wrong: \(error)")   // error will not be nil
            }
        }
        return(authCode,theError)
    }
}
