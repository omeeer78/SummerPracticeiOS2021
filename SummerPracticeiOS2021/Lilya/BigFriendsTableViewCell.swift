//
//  BigFriendsTableViewCell.swift
//  FriendsByLilya
//
//  Created by itisioslab on 06.07.2021.
//

import UIKit

class BigFriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var friendAvatar: UIImageView!
    @IBOutlet weak var friendName: UILabel!

    func SetData (friend: User){
        friendName.text = friend.name
        friendAvatar.image = friend.image
    }
}
