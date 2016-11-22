//
//  AuthErrorCode.swift
//  RedditReader
//
//  Created by Moorthy, Prashanth on 11/21/16.
//  Copyright © 2016 Prashanth Moorthy. All rights reserved.
//

import Foundation

enum AuthErrorCode : Error {
    case authorizationFailed
    case authorizationAlreadyInProgress

}
