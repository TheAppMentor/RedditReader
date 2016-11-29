//
//  UserInfo.swift
//  Pods
//
//  Created by Moorthy, Prashanth on 11/29/16.
//
//

import Foundation

struct UserInfo {
    
    var is_gold : Bool?
    var name : String?
    var features : [String : AnyObject?]?
    var gold_creddits: Int?
    var gold_expiration: Int?
    var inbox_count: Int?
    var is_employee: Bool?
    var has_mail: Bool?
    var is_suspended: Bool?
    var has_mod_mail: Bool?
    var has_verified_email: Bool?
    var link_karma: Int?
    var suspension_expiration_utc: Int?
    var id: String?
    var created: Int?
    var over_18: Bool?
    var in_beta: Bool?
    var hide_from_robots: Bool?
    var created_utc: Int?
    var is_mod: Bool?
    var comment_karma: Int?
    

    init(userInfoDict : [String : AnyObject?]) {
        is_gold  = userInfoDict["is_gold"] as? Bool ?? nil
        name  = userInfoDict["name"] as? String ?? nil
        features  = userInfoDict["features"] as? [String : AnyObject?] ?? nil
        gold_creddits  = userInfoDict["gold_creddits"] as? Int ?? nil
        gold_expiration  = userInfoDict["gold_expiration"] as? Int ?? nil
        inbox_count  = userInfoDict["inbox_count"] as? Int ?? nil
        is_employee  = userInfoDict["is_employee"] as? Bool ?? nil
        has_mail  = userInfoDict["has_mail"] as? Bool ?? nil
        is_suspended  = userInfoDict["is_suspended"] as? Bool ?? nil
        has_mod_mail  = userInfoDict["has_mod_mail"] as? Bool ?? nil
        has_verified_email  = userInfoDict["has_verified_email"] as? Bool ?? nil
        link_karma  = userInfoDict["link_karma"] as? Int ?? nil
        suspension_expiration_utc  = userInfoDict["suspension_expiration_utc"] as? Int ?? nil
        id  = userInfoDict["id"] as? String ?? nil
        created  = userInfoDict["created"] as? Int ?? nil
        over_18  = userInfoDict["over_18"] as? Bool ?? nil
        in_beta  = userInfoDict["in_beta"] as? Bool ?? nil
        hide_from_robots  = userInfoDict["hide_from_robots"] as? Bool ?? nil
        created_utc  = userInfoDict["created_utc"] as? Int ?? nil
        is_mod  = userInfoDict["is_mod"] as? Bool ?? nil
        comment_karma  = userInfoDict["comment_karma"] as? Int ?? nil
    }

}
