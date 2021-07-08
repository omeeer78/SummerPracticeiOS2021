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
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var annotationTextView: UITextView!
    
    func setData (film: Film) {
        titleLabel.text = film.title
        imageImageView.image = film.image
        annotationTextView.text = film.annotation
        ratingLabel.text = String(film.rating)
        ratingLabel.layer.masksToBounds = true
        ratingLabel.layer.cornerRadius = 5
        if film.rating >= 7 {
            ratingLabel.backgroundColor = UIColor(red: 0.00, green: 0.45, blue: 0.00, alpha: 1.00)
        } else if film.rating < 7 && film.rating > 5 {
            ratingLabel.backgroundColor = UIColor(red: 0.67, green: 0.66, blue: 0.66, alpha: 1.00)
        } else {
            ratingLabel.backgroundColor = UIColor(red: 0.82, green: 0.00, blue: 0.00, alpha: 1.00)
        }
    }
}
