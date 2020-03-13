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
    var favorited: Bool = false
    var tweetId: Int = -1
    var retweeted: Bool = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func favoriteTweet(_ sender: Any) {
        
        let tobeFavorited = !favorited
        
        if(tobeFavorited)
        {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorited(true)
            }, failure: { (Error) in
                print("Favorite did not succeed: \(Error)")
            })
        }
        else
        {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorited(false)
            }, failure: { (Error) in
                    print("unfavorite did not suceed: \(Error)")
            })
        }
            
            

    }
    
    func setRetweeted(_ isRetweeted: Bool)
    {
        if(isRetweeted)
        {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            
            retweetButton.isEnabled = false
            
        }
        
        else{
            
               retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
                     
              retweetButton.isEnabled = true
        }
    }
    
        
    
    func setFavorited(_ isFavorited:Bool)
    {
        favorited = isFavorited
        
        if(favorited)
        {
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else
        {
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    @IBAction func retweet(_ sender: Any) {
        
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (Error) in
            print("Error in retweeting \(Error)")
        })
    }
}
