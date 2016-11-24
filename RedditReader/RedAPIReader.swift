//
//  RedAPIReader.swift
//  RedditReader
//
//  Created by Moorthy, Prashanth on 11/18/16.
//  Copyright © 2016 Prashanth Moorthy. All rights reserved.
//

import Foundation


enum RedditAPIURLProvider : String{
    case hot = "listings/hot"
    case random = "listings/random"
    case top = "listings/top"
    case controversial = "listings/controversial"
    case new = "listings/new"
    
    private var baseURLString : String {
     return "https://oauth.reddit.com"
    }
    
    private var filePath : String{
        return ""
    }
    
    private var apiMappingFileURL : URL?{
        let bundlefilePath = Bundle.main.url(forResource: "RedditApiLookup", withExtension: "plist")
        return bundlefilePath
    }
    
    func getURL(requiresAuth : Bool) -> URL? {
        
        if let theFileURL = apiMappingFileURL{
            if let apiMapDict = NSDictionary(contentsOf: theFileURL) as? [String:AnyObject]{
                
                if let theNoAuthD = apiMapDict["No Auth"]{
                    print("No Authorization Required")
                    print ("The add on url is.... : \(theNoAuthD["listings/hot"])")
                    
                    print ("Try with Self : \(theNoAuthD[self.rawValue])")

                    return URL(string:(baseURLString + (theNoAuthD[self.rawValue] as! String)))
                }
            }
        }
        print("Could not find the URL : Returning Nil")
        return nil
    }
    
    
    
    func  fetchJSONForURL(theURL : URL) -> [String : AnyObject]? {
        
        return [:]
    }

    
}
