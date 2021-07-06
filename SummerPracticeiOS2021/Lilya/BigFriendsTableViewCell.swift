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
    
    
override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func SetData (friend: FriendsCellData){
        friendName.text = friend.name
        friendAvatar.image = friend.image
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
