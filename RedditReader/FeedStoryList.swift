//
//  FeedStoryList.swift
//  RedditReader
//
//  Created by Moorthy, Prashanth on 11/29/16.
//  Copyright © 2016 Prashanth Moorthy. All rights reserved.
//

import Foundation

struct FeedStoryList {
    
    
    func  fetchStories(feedType : RedditAPIHandler, completionHandler : () -> ()){

        
    }
    
    func allStories() -> [FeedStory] {
        return stories
    }
    
    func  firstStory() -> FeedStory? {
        return stories.first
    }
    
    func  lastStory() -> FeedStory? {
        return stories.last
    }
    
    func fetchNextStoryList(completionHandler : () -> ()){
        completionHandler()
    }
    
    func fetchPreviousStoryList(completionHandler : () -> ()) {
        completionHandler()
    }
    
    
    
    private var isFirstFetch : Bool{
        if allStories().count > 0 {
            return false
        }
        return true
    }
    
    private var fetchLimit : Int{
        if isFirstFetch{
            return 5
        }
        return 25
    }
    
    private var limitParamterForURL : String{
        return "/limit=\(fetchLimit)"
    }
    
    
    
    
    
    
    
    
    
    
    
    
    private var stories = [FeedStory]()
    
    init(storyFeedDict : [String:AnyObject?]) {
        stories = jsonParser(storyFeedDict)
    }
    
    private var nextStoryListID : String?
    private var previousStoryListID : String?
    
    mutating func jsonParser(_ theJSON : [String:AnyObject?]) -> [FeedStory]{
        
        var theStoryList = [FeedStory]()
        
        if let theData = theJSON["data"] as? [String:AnyObject]{
            
            if let theNextListID = theData["after"] as? String{
             nextStoryListID = theNextListID
            }

            if let thePrevListID = theData["before"] as? String{
                previousStoryListID = thePrevListID
            }
            
            // Fetch the Feed information.
            if let theChildren = theData["children"] as? [AnyObject]{
                for eachChild in theChildren{
                    
                    let theFeedStory = FeedStory()
                    
                    // Fetch the "kind" of story
                    if let theKind = eachChild["kind"] as? String{
                        theFeedStory.type = StoryType(rawValue: theKind)!
                    }
                    
                    if let theChildData = eachChild["data"] as? [String:AnyObject]{
                        // Fetch the Title
                        if let theTitle = theChildData["title"] as? String{
                            theFeedStory.title = theTitle
                        }
                        
                        // Fetch the URL
                        if let theURL = theChildData["url"] as? String{
                            if let storyURL = URL(string: theURL) {
                                theFeedStory.url = storyURL
                            }
                        }
                        
                        // Fetch the score
                        if let theScore = theChildData["score"] as? Int{
                            theFeedStory.score = theScore
                        }
                        
                        // Fetch the Number of Comments num_comments
                        if let theCommentCount = theChildData["num_comments"] as? Int{
                            theFeedStory.comments = theCommentCount
                        }
                        
                        // Fetch the Number of Comments num_comments
                        if let theSubReddit = theChildData["subreddit"] as? String{
                            theFeedStory.subreddit = theSubReddit
                        }
                        
                        // Fetch the Preview Image
                        if let thePreviewImageURL = theChildData["thumbnail"] as? String{
                            if thePreviewImageURL.isEmpty == false{
                                theFeedStory.previewImageURL = URL(string: thePreviewImageURL)
                            }
                        }
                        
                        // Fetch the Preview Image
                        if let theStoryURL = theChildData["url"] as? String{
                            theFeedStory.storyURL = URL(string: theStoryURL)
                        }
                        
                    }
                    theStoryList.append(theFeedStory)
                }
            }
        }
        return theStoryList
    }

    
    
    
}
