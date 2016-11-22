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
    func authorizeUser() -> (accessToken : String?, error : AuthErrorCode?)
    func signOutUser() -> AuthErrorCode?
    
    func fetchJSONForURL() -> [String:AnyObject]
    
    var authorizeContext : AnyObject? {get}
    
    func handleRedirectURL(theURL : URL)
}
