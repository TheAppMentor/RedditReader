//
//  FeedStory.swift
//  RedditReader
//
//  Created by Moorthy, Prashanth on 7/20/16.
//  Copyright © 2016 Prashanth Moorthy. All rights reserved.
//

import UIKit

open class FeedStory : CustomStringConvertible{
    
    open var description: String {
        return "\n\n\n Feed Story  --> \n \t Title      : \(title)\n \t Type       : \(type)\n \t URL        : \(url)\n \t Preview    : \(previewImageURL)\n \t Score      : \(score)\n \t Comments   : \(comments)"
    }
    
    var title : String
    var type : StoryType
    var url : URL
    var previewImageURL : URL?
    var score : Int
    var comments : Int
    var subreddit : String
    var storyURL : URL?
    
    init(){
        title = ""
        type = .Comment
        url = URL(string: "")!
        score = 0
        comments = 0
        subreddit = ""
    }
}
