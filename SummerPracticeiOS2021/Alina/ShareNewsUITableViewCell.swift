//
//  ShareNewsUITableViewCell.swift
//  SummerPracticeiOS2021
//
//  Created by Alina Bikkinina on 06.07.2021.
//

import UIKit

class ShareNewsUITableViewCell: UITableViewCell {
    
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var recomendationLabel: UILabel!
    @IBOutlet weak var filmTitleLabel: UILabel!
    @IBOutlet weak var filmDescriptionTextView: UITextView!
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var filmImageView: UIImageView!
    
    func setData(action: Action){
        friendNameLabel.text = action.friend.name
        recomendationLabel.text = action.actionType.rawValue //"рекомендует Вам посмотреть фильм"
        filmTitleLabel.text = action.film.title
        filmDescriptionTextView.text = action.film.annotation
        friendImageView.image = action.friend.image
        filmImageView.image = action.film.image
    }
}
