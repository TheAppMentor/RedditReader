//
//  AuthHandler.swift
//  RedditReader
//
//  Created by Moorthy, Prashanth on 11/21/16.
//  Copyright © 2016 Prashanth Moorthy. All rights reserved.
//

import Foundation
import UIKit

protocol AuthHandler {
    //func authorizeUser(completionHanlder : (accessToken : String?, userInfo : [String:AnyObject?], error : AuthErrorCode?))
    func authorizeUser(completionHanlder : @escaping (_ accessToken : String?, _ userInfo : [String:AnyObject?], _ error : AuthErrorCode?) -> ())

    func signOutUser() -> AuthErrorCode?
    
    //func fetchJSONForURL(theURL : URL, completionHandler :  @escaping (_ result : [String : AnyObject]?) -> ())
    //func fetchJSONForURLWithUserAuth(theURL : URL, requiresUserName : Bool, completionHandler : @escaping (_ result : [String : AnyObject]?) -> ())
    func fetchJSONForURLWithUserAuth(theURL : URL, requiresUserName : Bool, completionHandler : @escaping (_ result : [String : AnyObject]?, _ userInfo : UserInfo) -> ())


    func fetchJSONForURLNoUserAuthRequired(theURL : URL, completionHandler : @escaping (_ result : [String : AnyObject]?) -> ())
    
    // Which screen/Object will present the authorization screen. Normallly it will be the screen that requires the user to authenticate.
    var authorizeContext : AnyObject? {get}
    
    func handleRedirectURL(theURL : URL)
}
