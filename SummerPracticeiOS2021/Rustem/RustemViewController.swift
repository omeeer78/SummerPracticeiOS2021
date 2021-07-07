//
//  RustemViewController.swift
//  SummerPracticeiOS2021
//
//  Created by Марданов Амир on 03.07.2021.
//

import UIKit

class RustemViewController: UIViewController {
    
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var wantToWatchButton: UIButton!
    @IBOutlet weak var alreadyWatchedButton: UIButton!
    @IBOutlet weak var nowWatchingButton: UIButton!
    @IBOutlet weak var favoriteGenreButton: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*var wantToWatchValue = data.users[0].checklist.filter()
         var nowWatchingValue = data.users[0].checklist.filter()
         var alreadyWatchedValue = data.users[0].checklist.filter()
         wantToWatch.currentTitle =
         nowWatching.currentTitle =
         alreadyWatched.currentTitle =
         */
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        imageImageView.image = data.users[0].image
        nicknameLabel.text = data.users[0].name
        var genre = "всё"
        switch data.users[0].favoriteGenre {
        case Genre.action:
            genre = "экшн"
        case Genre.comedy:
            genre = "комедии"
        case Genre.drama:
            genre = "драмы"
        case Genre.horror:
            genre = "хорроры"
        case Genre.thriller:
            genre = "триллеры"
        }
        favoriteGenreButton.text = genre
    }
    
    
    @IBAction func editProfileButtonItem(_ sender: UIBarButtonItem) {
        guard let editVC = storyboard?.instantiateViewController(withIdentifier: "EditViewController") else { return  }
        navigationController?.pushViewController(editVC, animated: true)
    }
    
    @IBAction func goToWatchListButton(_ sender: UIButton) {
        guard let watchList = storyboard?.instantiateViewController(withIdentifier: "EditViewController") else { return }
        navigationController?.pushViewController(watchList, animated: true)
    }
    
    @IBAction func goToAlreadyWatchedButton(_ sender: UIButton) {
    }
    
    @IBAction func goToNowWatchingButton(_ sender: UIButton) {
    }
    
    
    
    
}
