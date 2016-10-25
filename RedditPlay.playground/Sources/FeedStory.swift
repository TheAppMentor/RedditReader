//
//  FeedStory.swift
//  RedditReader
//
//  Created by Moorthy, Prashanth on 7/20/16.
//  Copyright © 2016 Prashanth Moorthy. All rights reserved.
//

import UIKit

public class FeedStory : CustomStringConvertible{
    
    public var description: String {
        return "\n\n\n Feed Story  --> \n \t Title      : \(title)\n \t Type       : \(type)\n \t URL        : \(url)\n \t Preview    : \(previewImageURL)\n \t Score      : \(score)\n \t Comments   : \(comments)"
    }
    
    public var title : String
    public var type : StoryType
    public var url : NSURL
    public var previewImageURL : NSURL?
    public var score : Int
    public var comments : Int
    public var subreddit : String
    public var storyURL : NSURL?
    
    public init(){
        title = ""
        type = .Comment
        url = NSURL(string: "")!
        score = 0
        comments = 0
        subreddit = ""
    }
}
