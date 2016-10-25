 as URLRequest//: Playground - noun: a place where people can play

import UIKit
import XCPlayground


class RedditFetcher {
    
    static let sharedFetcher = RedditFetcher()
    
    var storyList = [FeedStory]() {
        didSet {
            NotificationCenter.defaultCenter.postNotificationName("NewFeedAvailable", object: self, userInfo: ["FeedList":storyList])
        }
    }
    
    private init(){
        
    }
    
    let theRequest = NSURLRequest(url: NSURL(string: "https://www.reddit.com/hot/.json")! as URL)
    
    func jsonParser(theJSON : [String:AnyObject?]) -> [FeedStory]{
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
                            if let storyURL = NSURL(string: theURL) {
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
                                theFeedStory.previewImageURL = NSURL(string: thePreviewImageURL)
                            }
                        }
                        
                        // Fetch the Preview Image
                        if let theStoryURL = theChildData["url"] as? String{
                            theFeedStory.storyURL = NSURL(string: theStoryURL)
                        }
                        
                    }
                    theStoryList.append(theFeedStory)
                }
            }
        }
        return theStoryList
    }
    
    
    func fetchJSONFromReddit(URL : NSURL){
        let theFetch = URLSession.sharedSession.dataTask(with: theRequest as URLRequest) {[unowned self](theData, theResponse, theError) -> Void in
            
            let theJSON = try! NSJSONSerialization.JSONObjectWithData(theData!, options: .MutableLeaves)
            print("We have the JSON")
            if let theFinalJSON = theJSON as? [String : AnyObject]{
                self.storyList = self.jsonParser(theFinalJSON)
            }
        }
        
        theFetch.resume()
    }
}


// Fetch the JSON

let theR = RedditFetcher.sharedFetcher
let theRequest = NSURLRequest(url: NSURL(string: "https://www.reddit.com/hot/.json")! as URL)


theR.fetchJSONFromReddit(URL: NSURL(string: "https://www.reddit.com/hot/.json")!)



XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
