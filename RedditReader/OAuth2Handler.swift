//
//  OAuth2Handler.swift
//  RedditReader
//
//  Created by Moorthy, Prashanth on 11/9/16.
//  Copyright © 2016 Prashanth Moorthy. All rights reserved.
//

import Foundation
import p2_OAuth2

class OAuth2Handler{

    let oauth2 = OAuth2CodeGrant(settings: [
        "client_id": "my_swift_app",
        "client_secret": "",
        "authorize_uri": "www.reddit.com",
        "token_uri": "https://github.com/login/oauth/access_token",   // code grant only
        "redirect_uris": ["redditReaderCustomURLScheme://"],   // register your own "myapp" scheme in Info.plist
        "scope": "user repo:status",
        "secret_in_body": true,    // Github needs this
        "keychain": false,         // if you DON'T want keychain integration
        ] as OAuth2JSON)

    
//    let oauth2 = OAuth2CodeGrant(settings: [
//        "client_id": "my_swift_app",
//        "client_secret": "C7447242",
//        "authorize_uri": "https://github.com/login/oauth/authorize",
//        "token_uri": "https://github.com/login/oauth/access_token",   // code grant only
//        "redirect_uris": ["redditReaderCustomURLScheme://"],   // register your own "myapp" scheme in Info.plist
//        "scope": "user repo:status",
//        "secret_in_body": true,    // Github needs this
//        "keychain": false,         // if you DON'T want keychain integration
//        ] as OAuth2JSON)
    
}



//
