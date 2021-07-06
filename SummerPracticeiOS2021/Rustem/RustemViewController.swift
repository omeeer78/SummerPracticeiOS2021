//
//  RustemViewController.swift
//  SummerPracticeiOS2021
//
//  Created by Марданов Амир on 03.07.2021.
//

import UIKit

class RustemViewController: UIViewController {
    
    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var wantToWatch: UIButton!
    @IBOutlet weak var alreadyWatched: UIButton!
    @IBOutlet weak var nowWatching: UIButton!
    @IBOutlet weak var favoriteGenre: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = data.users[0].image
        nickname.text = data.users[0].name
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
        favoriteGenre.text = genre
        /*var wantToWatchValue = data.users[0].checklist.filter()
        var nowWatchingValue = data.users[0].checklist.filter()
        var alreadyWatchedValue = data.users[0].checklist.filter()
        wantToWatch.currentTitle =
            nowWatching.currentTitle =
            alreadyWatched.currentTitle =
 */
        
    }
    
    
    @IBAction func editProfile(_ sender: UIBarButtonItem) {
        guard let editVC = storyboard?.instantiateViewController(withIdentifier: "EditViewController") else { return  }
        navigationController?.pushViewController(editVC, animated: true)
    }
    
    @IBAction func goToWatchList(_ sender: UIButton) {
        guard let watchList = storyboard?.instantiateViewController(withIdentifier: "EditViewController") else { return }
        navigationController?.pushViewController(watchList, animated: true)
    }
    
    @IBAction func goToAlreadyWatched(_ sender: UIButton) {
    }
    
    @IBAction func goToNowWatching(_ sender: UIButton) {
    }
    
    
    
    
}
