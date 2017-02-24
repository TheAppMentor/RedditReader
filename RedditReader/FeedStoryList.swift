//
//  FeedStoryList.swift
//  RedditReader
//
//  Created by Moorthy, Prashanth on 11/29/16.
//  Copyright © 2016 Prashanth Moorthy. All rights reserved.
//

import Foundation

struct FeedStoryList {
    
    var apiParmList = ["read_hot":["after","before","count","limit","show","sr_detail"]]
    
    
    func  fetchStories(feedType : RedditInterface, completionHandler : () -> ()){

        let parmList = RedditAPIToParmMap.parameterList(feedType: feedType)
        
        //let redAPIHandler = RedditAPIHandler.read_hot(after: <#T##String?#>, before: <#T##String?#>, count: <#T##Int?#>, limit: <#T##Int?#>, show: <#T##String?#>, sr_detail: <#T##Bool?#>)
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
    
    func buildParmString(parmList : [RedditAPIParmType]) -> String? {
        
        var parmString = ""
        
        for eachParm in parmList{
            switch eachParm {
            case .after:
                print("Processing \(eachParm)")
                return nextStoryListID ?? nil
            case .before:
                print("Processing \(eachParm)")
                return previousStoryListID
            case .limit:
                print("Processing \(eachParm)")
                return limitParamterForURL
            case .count:
                print("Processing \(eachParm)")
            case .show:
                print("Processing \(eachParm)")
            case .sr_detail:
                print("Processing \(eachParm)")
            }
        }
        return nil
    }
    
    
    func buildParmURLForAfter() -> String? {
        
        return nil
    }

    
    func buildParmURLForBefore() -> String? {
        
        return nil
    }

    
    func buildParmURLForLimit() -> String? {
        
        return nil
    }

    
    func buildParmURLForCount() -> String? {
        
        return nil
    }

    func buildParmURLForShow() -> String? {
        
        return nil
    }

    func buildParmURLForSubRedditDetail() -> String? {
        
        
        return nil
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
    
    private var afterParamterForURL : String{
        return "after=\(nextStoryListID)"
    }

    private var beforeParamterForURL : String{
        return "before=\(nextStoryListID)"
    }
    
    private var nextStoryListID : String?

    private var previousStoryListID : String?
    
    init() {}
    
    private var stories = [FeedStory]()
    
    init(storyFeedDict : [String:AnyObject?]) {
        stories = jsonParser(storyFeedDict)
    }
    
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
