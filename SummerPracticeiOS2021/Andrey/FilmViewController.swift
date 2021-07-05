//
//  FilmViewController.swift
//  SummerPracticeiOS2021
//
//  Created by itisioslab on 05.07.2021.
//

import UIKit

class FilmViewController: UIViewController {
    
    var film:Film?
    
    @IBOutlet weak var filmTitle: UILabel!
    
    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var genre: UILabel!
    
    @IBOutlet weak var annotation: UILabel!
    
    @IBOutlet weak var director: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmTitle.text = film.title
        rating.text = film.rating
        image.image = film.image
        genre.text = film.genre
        annotation.text = film.annotation
        director.text = film.director
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
