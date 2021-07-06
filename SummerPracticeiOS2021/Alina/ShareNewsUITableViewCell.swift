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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(film: Film, friend: User){
        friendNameLabel.text = friend.name
        recomendationLabel.text = "рекомендует Вам посмотреть фильм"
        filmTitleLabel.text = film.title
        filmDescriptionTextView.text = film.annotation
        friendImageView.image = friend.image
        filmImageView.image = film.image
    }
}
