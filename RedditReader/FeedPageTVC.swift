//
//  FeedPageTVC.swift
//  RedditReader
//
//  Created by Moorthy, Prashanth on 7/20/16.
//  Copyright © 2016 Prashanth Moorthy. All rights reserved.
//

import UIKit




class FeedPageTableViewController: UITableViewController {
    
    var storyList = [FeedStory]()
    var selectedStoryURL : URL?
    
    let theRequest = URL(string: "https://www.reddit.com/hot/.json")
    
    @IBAction func openLeftMenu(_ sender: UIBarButtonItem) {
//        openLeft()
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        
        // Set Navigation Bar Title Properties.

        
        refreshControl = UIRefreshControl()
        tableView.addSubview(refreshControl!)
        refreshControl?.backgroundColor = UIColor.cyan
        refreshControl!.addTarget(self, action: #selector(FeedPageTableViewController.refreshTableView), for: .valueChanged)
        
        NotificationCenter.default.addObserver(self, selector: #selector(FeedPageTableViewController.updateUI(_:)), name: NSNotification.Name(rawValue: "NewFeedAvailable"), object: nil)
        RedditFetcher.sharedFetcher.fetchJSONFromReddit(theRequest!)
    }
    
    func refreshTableView() {
        RedditFetcher.sharedFetcher.fetchJSONFromReddit(theRequest!)
        
        // OAuth.. forget the tokens.
        (UIApplication.shared.delegate as? AppDelegate)?.oauth2.forgetTokens()
    }
    
    func updateUI(_ notification : Notification)  {
        print("Got a Notification")
        if let theStoryList = (notification as NSNotification).userInfo?["FeedList"] as? [FeedStory]{
            storyList = theStoryList
            DispatchQueue.main.async(execute: { 
                self.refreshControl?.endRefreshing()
                self.tableView.reloadData()
            })
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storyList.count
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var theCell = tableView.dequeueReusableCell(withIdentifier: "textonlycell")!
        
        if let theThumbnailImageURL =  storyList[(indexPath as NSIndexPath).row].previewImageURL {
            theCell = tableView.dequeueReusableCell(withIdentifier: "previewImageCell")!
            // Populate the Image
            if let thePreviewImage = theCell.viewWithTag(99) as? UIImageView{
                thePreviewImage.image = UIImage(named: "placeholder")
                
                if let theImageData = try? Data(contentsOf: theThumbnailImageURL as URL){
                        thePreviewImage.image = UIImage(data:theImageData)
                    }
                }
        }
        
        // Populate the Title
        if let theTitleLabel = theCell.viewWithTag(1) as? UITextView{
            theTitleLabel.textContainer.maximumNumberOfLines = 3
            theTitleLabel.textContainer.lineBreakMode = NSLineBreakMode.byTruncatingTail
            theTitleLabel.textContainerInset = UIEdgeInsets.zero;
            theTitleLabel.textContainer.lineFragmentPadding = 0;
            theTitleLabel.text = storyList[(indexPath as NSIndexPath).row].title
        }

        // Populate the Subreddit
        if let theCommentsCountLabel = theCell.viewWithTag(3) as? UILabel{
            theCommentsCountLabel.text = "/r/" + storyList[(indexPath as NSIndexPath).row].subreddit
            theCommentsCountLabel.textColor = UIColor.blue
        }

        // Populate the Number of Comments
        if let theCommentsCountLabel = theCell.viewWithTag(5) as? UILabel{
            theCommentsCountLabel.text = String(storyList[(indexPath as NSIndexPath).row].comments)
        }
        
        return theCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let theStoryURL = storyList[(indexPath as NSIndexPath).row].storyURL{
            selectedStoryURL = theStoryURL as URL
            performSegue(withIdentifier: "showStoryDetail", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showStoryDetail"{
            if let theStoryDetailVC = segue.destination as? StoryDetailVC{
                theStoryDetailVC.storyURL = selectedStoryURL
            }
        }
    }
    
    
}
