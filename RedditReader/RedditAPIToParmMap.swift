//
//  RedditAPIToParmMap.swift
//  RedditReader
//
//  Created by Moorthy, Prashanth on 12/1/16.
//  Copyright © 2016 Prashanth Moorthy. All rights reserved.
//

import Foundation

struct RedditAPIToParmMap{
    
   static func parameterList(feedType : RedditInterface) -> [RedditAPIParmType]? {
        
        var parmListToReturn = [RedditAPIParmType]()
        
        switch feedType {
        case .read_hot:
            return [.after,.before,.count,.limit,.show,.sr_detail]
        default:
            return parmListToReturn
        }
        
        return parmListToReturn
    }
    
}
