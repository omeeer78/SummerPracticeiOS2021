//
//  FilmViewController.swift
//  SummerPracticeiOS2021
//
//  Created by itisioslab on 05.07.2021.
//

import UIKit

protocol FilmViewControllerDelegate: AnyObject {
    func reloadTable(page: Int)
}

class FilmViewController: UIViewController {
    
    @IBOutlet weak var filmTitleLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var annotationLabel: UILabel!
    
    @IBOutlet weak var directorLabel: UILabel!
    
    var film : Film?
    
    weak var delegate: FilmViewControllerDelegate?
    
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
            ratingLabel.textColor = .systemRed
        }
        if rate > 4 && rate <= 7 {
            ratingLabel.textColor = .systemYellow
        }
        if rate > 7 {
            ratingLabel.textColor = .systemGreen
        }
    }
    
    @IBAction func addToWantToWatch(_ sender: Any) {
        guard let film = film else { return }
        
        data.updateFilmCheckListStatus(film: film, newStatus: .wantToWatch)
        delegate?.reloadTable(page: Status.wantToWatch.rawValue)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addToWatchingNow(_ sender: Any) {
        
        guard let film = film else { return }
        
        data.updateFilmCheckListStatus(film: film, newStatus: .watching)
        delegate?.reloadTable(page: Status.watching.rawValue)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addToCompleted(_ sender: Any) {
        guard let film = film else { return }
        
        data.updateFilmCheckListStatus(film: film, newStatus: .completed)
        delegate?.reloadTable(page: Status.completed.rawValue)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func recommendToFriend(_ sender: Any) {
        
        guard let recommendViewController = storyboard?.instantiateViewController(identifier: "RecommendViewController") as? RecommendViewController else { return }
        recommendViewController.filmToRecommend = film ?? nil
        present(recommendViewController, animated: true, completion: nil)
    }
    
}
