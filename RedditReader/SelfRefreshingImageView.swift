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
    
    var imageURL : URL?{
        didSet{
            fetchPreviewImage { (theFetchedImage) in
                self.image = theFetchedImage
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = #imageLiteral(resourceName: "placeholder")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.image = #imageLiteral(resourceName: "placeholder")
        //fatalError("init(coder:) has not been implemented")
    }
    
    
    var preViewImage : UIImage? = #imageLiteral(resourceName: "placeholder"){
        didSet{
            print("We have a preview Image now.. Refresh the View")
        }
    }
    
    func fetchPreviewImage(completionHanlder : @escaping (_ theFinalImage : UIImage?) -> ()){
        
        if let validPreviewURL = imageURL{
            let theDataFetchTask = URLSession.shared.dataTask(with: validPreviewURL){(theData, theRespone, theError) in
                
                if theError == nil{
                    if let validData = theData{
                        completionHanlder(UIImage(data: validData))
                        //self.setNeedsDisplay()
                    }
                }else{
                    print("We have an error fetching the Image. \(theError)")
                }
            }
            
            theDataFetchTask.resume()
        }
    }
}
