//
//  SelfRefreshingImageView.swift
//  RedditReader
//
//  Created by Moorthy, Prashanth on 11/30/16.
//  Copyright © 2016 Prashanth Moorthy. All rights reserved.
//

import UIKit

class SelfRefreshingImageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var imageURL : URL?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = #imageLiteral(resourceName: "placeholder")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
