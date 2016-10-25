//
//  RedditFetcher.swift
//  RedditReader
//
//  Created by Moorthy, Prashanth on 7/20/16.
//  Copyright © 2016 Prashanth Moorthy. All rights reserved.
//

import Foundation

class RedditFetcher {
    
    static let sharedFetcher = RedditFetcher()
    
    var storyList = [FeedStory]() {
        didSet {
            NotificationCenter.default.post(name: Notification.Name(rawValue: "NewFeedAvailable"), object: self, userInfo: ["FeedList":storyList])
        }
    }
    
    fileprivate init(){
        
    }
    
    let theRequest = URLRequest(url: URL(string: "https://www.reddit.com/hot/.json")!)
    
    func jsonParser(_ theJSON : [String:AnyObject?]) -> [FeedStory]{
        print("JSON Parser Running......")
        
        var theStoryList = [FeedStory]()
        
        if let theData = theJSON["data"] as? [String:AnyObject]{
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
    
    
    func fetchJSONFromReddit(_ URL : Foundation.URL){
        let theFetch = URLSession.shared.dataTask(with: theRequest, completionHandler: {[unowned self](theData, theResponse, theError) -> Void in
            
            let theJSON = try! JSONSerialization.jsonObject(with: theData!, options: .mutableLeaves)
            print("We have the JSON")
            if let theFinalJSON = theJSON as? [String : AnyObject]{
                self.storyList = self.jsonParser(theFinalJSON)
            }
        }) 

        theFetch.resume()
    }
    
    
    
}
