//
//  FilmTableViewCell.swift
//  SummerPracticeiOS2021
//
//  Created by Алсу Хайруллина on 06.07.2021.
//

import UIKit

class FilmTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData (film: Film) {
        titleLabel.text = film.title
        imageImageView.image = film.image
    }
}
