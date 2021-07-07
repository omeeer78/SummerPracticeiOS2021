//
//  FilmViewController.swift
//  SummerPracticeiOS2021
//
//  Created by itisioslab on 05.07.2021.
//

import UIKit

class FilmViewController: UIViewController {
    
    @IBOutlet weak var filmTitleLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var annotationLabel: UILabel!
    
    @IBOutlet weak var directorLabel: UILabel!
    
    var film : Film?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmTitleLabel.text = film?.title
        ratingLabel.text = String(film?.rating ?? 0.0)
        imageView.image = film?.image
        genreLabel.text = film?.genre.rawValue
        annotationLabel.text = film?.annotation
        directorLabel.text = film?.director
        
        setRatingColor(rate: film?.rating ?? 0.0)
    }
    
    func setRatingColor(rate: Double){
        
        if rate <= 4 {
            ratingLabel.textColor = .red
        }
        if rate > 4 && rate <= 7 {
            ratingLabel.textColor = .orange
        }
        if rate > 7 {
            ratingLabel.textColor = .green
        }
    }
    
}
