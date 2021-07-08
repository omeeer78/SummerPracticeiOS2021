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
    
    func setData(action: Action){
        friendNameLabel.text = action.friend.name
        recomendationLabel.text = action.actionType.rawValue //"рекомендует Вам посмотреть фильм"
        filmTitleLabel.text = action.recommendedFilm.title
        filmDescriptionTextView.text = action.recommendedFilm.annotation
        friendImageView.image = action.friend.image
        filmImageView.image = action.recommendedFilm.image
    }
}
