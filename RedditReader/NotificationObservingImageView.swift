//
//  NotificationObservingImageView.swift
//  RedditReader
//
//  Created by Moorthy, Prashanth on 11/30/16.
//  Copyright © 2016 Prashanth Moorthy. All rights reserved.
//

import UIKit

class NotificationObservingImageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NotificationCenter.default.addObserver(self, selector: #selector(refreshImage), name: NSNotification.Name(rawValue: "refreshImage"), object: nil)
    }
    
    func refreshImage(){
        print("We are now refreshing the image")
        self.reloadInputViews()
    }

}
