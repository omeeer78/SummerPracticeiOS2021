//
//  FriendsListTableViewCell.swift
//  SummerPracticeiOS2021
//
//  Created by itisioslab on 08.07.2021.
//

import UIKit

class FriendsListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var friendAvatar: UIImageView!
    @IBOutlet weak var friendName: UILabel!

    func SetData(friends: User)  {
        friendName.text = friends.name
        friendAvatar.image = friends.image
    }

}
