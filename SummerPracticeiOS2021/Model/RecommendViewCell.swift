//
//  RecommendViewCell.swift
//  SummerPracticeiOS2021
//
//  Created by itisioslab on 09.07.2021.
//

import UIKit

class RecommendViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarView: UIImageView!
    
    func setData(_ user: User) {
        nameLabel.text = user.name
        avatarView.image = user.image
    }
    
}
