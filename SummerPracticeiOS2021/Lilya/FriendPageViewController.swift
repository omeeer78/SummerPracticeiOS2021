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
    @IBOutlet weak var friendsGrid: UILabel!
    
    @IBOutlet weak var watchedLabel: UILabel!
    @IBOutlet weak var watchingLabel: UILabel!
    @IBOutlet weak var wantwatchLabel: UILabel!
    
    var friends: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsGrid.text = "Друзья " + friends.name + "'s"
        watchedLabel.text = "66"
        watchingLabel.text = "100"
        wantwatchLabel.text = "45"
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
