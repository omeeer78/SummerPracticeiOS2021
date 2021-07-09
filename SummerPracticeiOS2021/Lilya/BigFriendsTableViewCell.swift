//
//  BigFriendsTableViewCell.swift
//  FriendsByLilya
//
//  Created by itisioslab on 06.07.2021.
//

import UIKit

class BigFriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var friendAvatarImageView: UIImageView!
    @IBOutlet weak var friendNameLabel: UILabel!

    func setData(friend: User)  {
        friendNameLabel.text = friend.name
        friendAvatarImageView.image = friend.image
    }
}
