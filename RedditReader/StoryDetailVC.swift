//
//  StoryDetailVC.swift
//  RedditReader
//
//  Created by Moorthy, Prashanth on 7/21/16.
//  Copyright © 2016 Prashanth Moorthy. All rights reserved.
//

import UIKit
import SafariServices

class StoryDetailVC: UIViewController {
    
    
    @IBOutlet weak var storyDisplayWebView: UIWebView!
    
    var storyURL : URL?
    
    
    override func viewDidLoad() {
        
//        let sURL = "http://moneycontrol.com"
//        let url = NSURL(string: sURL)
//        let safari = SFSafariViewController(URL: storyURL!, entersReaderIfAvailable: true)
//        presentViewController(safari, animated: true, completion: nil)
        
//        let testURL = NSURL(string: "http://www.readability.com/m?url=http://www.deccanherald.com/content/559315/india-lashes-pak-over-jampk.html")!
        
        if let theStoryURL = storyURL{
            let theLoadRequest = URLRequest(url: theStoryURL)
//            let theLoadRequest = NSURLRequest(URL: testURL)
            storyDisplayWebView.loadRequest(theLoadRequest)
        }
    }
    
//    override func viewDidAppear(animated: Bool) {
//                let url = NSURL(string: sURL)
//                let safari = SFSafariViewController(URL: storyURL!, entersReaderIfAvailable: true)
//                presentViewController(safari, animated: true, completion: nil)
//
//    }
    
}
