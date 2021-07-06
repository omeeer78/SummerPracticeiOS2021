//
//  FilmViewController.swift
//  SummerPracticeiOS2021
//
//  Created by itisioslab on 05.07.2021.
//

import UIKit

class FilmViewController: UIViewController {
    
    @IBOutlet weak var filmTitle: UILabel!
    
    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var genre: UILabel!
    
    @IBOutlet weak var annotation: UILabel!
    
    @IBOutlet weak var director: UILabel!
    
    var film : Film?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        filmTitle.text = film?.title
        rating.text = String(film?.rating ?? 0.0)
        image.image = film?.image
        genre.text = film?.genre.rawValue
        annotation.text = film?.annotation
        director.text = film?.director
        
        setRatingColor(rate: film?.rating ?? 0.0)
    }
    
    func setRatingColor(rate: Double){
        
        if rate <= 4{
            rating.textColor = UIColor.red
        }
        if rate > 4 && rate <= 7{
            rating.textColor = UIColor.orange
        }
        if rate > 7 {
            rating.textColor = UIColor.green
        }
    }
    
}
