//
//  FriendPageViewController.swift
//  SummerPracticeiOS2021
//
//  Created by itisioslab on 06.07.2021.
//

import UIKit

class FriendPageViewController: UIViewController {

    @IBOutlet weak var avaImage: UIImageView!
    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var favGenre: UILabel!
    @IBOutlet weak var recomendations: UILabel!
    
    @IBOutlet weak var watchedLabel: UILabel!
    @IBOutlet weak var watchingLabel: UILabel!
    @IBOutlet weak var wantwatchLabel: UILabel!
    
    var friends: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recomendations.text = "Рекомендации " + friends.name //+ "'s"
        let a: String = String(Status.completed.rawValue)
        let b: String = String(Status.watching.rawValue)
        let c: String = String(Status.wantToWatch.rawValue)
        watchedLabel.text = a
        watchingLabel.text = b
        wantwatchLabel.text = c
        watchingLabel.text = b
        wantwatchLabel.text = c
        avaImage.image = friends.image
        nickname.text = friends.name
        var genre = "всё"
        switch friends.favoriteGenre {
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
        favGenre.text = genre
    }
    
    @IBAction func watchedButtonFuction(_ sender: Any) {

    }
    
    @IBAction func watchingButtonFunction(_ sender: Any) {
      
    }
    
    @IBAction func wantToWatchButtonFuction(_ sender: Any) {
     
    }
}
