//
//  LeftSlideMenuTVC.swift
//  RedditReader
//
//  Created by Moorthy, Prashanth on 7/22/16.
//  Copyright © 2016 Prashanth Moorthy. All rights reserved.
//

import UIKit

class LeftSlideMenu: UITableViewController {
    
    let TrendingArray = ["Trending_1","Trending_2","Trending_3","Trending_4"]
    let SubredditArray = ["subreddit_1","subreddit_2","subreddit_3","subreddit_4"]
    
    override func viewDidLoad() {
        tableView.backgroundColor = UIColor(red: (29.0/255.0), green: (29.0/255.0), blue: (29.0/255.0), alpha: 0.90)
        tableView.separatorStyle = .none
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return TrendingArray.count
        case 1:
            return SubredditArray.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Trending"
        case 1:
            return "Subreddit"
        default:
            return ""
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let theCell = tableView.dequeueReusableCell(withIdentifier: "testCell")!
        theCell.backgroundColor = UIColor.clear
        
        switch (indexPath as NSIndexPath).section {
        case 0:
            theCell.textLabel?.text = TrendingArray[(indexPath as NSIndexPath).row]
        case 1:
            theCell.textLabel?.text = SubredditArray[(indexPath as NSIndexPath).row]

        default :
            theCell.textLabel?.text = "Unknown"
        }

        return theCell
    }
    
    
}
