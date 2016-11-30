//
//  FeedStory.swift
//  RedditReader
//
//  Created by Moorthy, Prashanth on 7/20/16.
//  Copyright © 2016 Prashanth Moorthy. All rights reserved.
//

import UIKit
import Foundation

class FeedStory : CustomStringConvertible{
    
     var description: String {
        return "\n\n\n Feed Story  --> \n \t Title      : \(title)\n \t Type       : \(type)\n \t URL        : \(url)\n \t Preview    : \(previewImageURL)\n \t Score      : \(score)\n \t Comments   : \(comments)"
    }
    
    var title : String
    var type : StoryType
    var url : URL
    var score : Int
    var comments : Int
    var subreddit : String
    var storyURL : URL?
    
    var previewImageURL : URL? {
        didSet {
            if previewImageURL != nil{
                fetchPreviewImage {(theFinalImage) in
                    self.preViewImage = theFinalImage
                }
            }
        }
    }
    
    var preViewImage : UIImage? = #imageLiteral(resourceName: "placeholder"){
        didSet{
            print("We have a preview Image now.. Refresh the View")
        }
    }
    
    func fetchPreviewImage(completionHanlder : @escaping (_ theFinalImage : UIImage?) -> ()){
        
        if let validPreviewURL = previewImageURL{
            let theDataFetchTask = URLSession.shared.dataTask(with: validPreviewURL){(theData, theRespone, theError) in
                
                if theError == nil{
                    if let validData = theData{
                        completionHanlder(UIImage(data: validData))
                    }
                }else{
                    print("We have an error fetching the Image. \(theError)")
                }
            }
            
            theDataFetchTask.resume()
        }
    }
    
    
    init(){
        title = ""
        type = .Comment
        url = URL(string: "https://reddit.com/hot.json")!
        score = 0
        comments = 0
        subreddit = ""
    }
    
}
