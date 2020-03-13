//
//  TweetCell.swift
//  Twitter
//
//  Created by admin on 3/7/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func favoriteTweet(_ sender: Any) {
        
        var favorited: Bool = false
        func setFavorited(_isFavorited:Bool)
        {
            favorited = _isFavorited
            
            if(favorited)
            {
                
            }
        }
    }
    
    @IBAction func retweet(_ sender: Any) {
    }
}
