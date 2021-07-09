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
    @IBOutlet weak var friendsRecs: UILabel!
    
    @IBOutlet weak var watchedLabel: UILabel!
    @IBOutlet weak var watchingLabel: UILabel!
    @IBOutlet weak var wantwatchLabel: UILabel!
    
    @IBOutlet weak var recomendsTableView: UITableView!
    
    var friends: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recomendations.text = "Рекомендации " + friends.name //+ "'s"
        let a: String = String(friends.checklist.filter{$0.status == Status.completed}.count)
        let b: String = String(friends.checklist.filter{$0.status == Status.watching}.count)
        let c: String = String(friends.checklist.filter{$0.status == Status.wantToWatch}.count)
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
        recomendsTableView.dataSource = self
        recomendsTableView.delegate = self
    }
    
}

extension FriendPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let filteredData = data.actions[data.presentUser]?.filter{$0.actionType == ActionType.sharing}
        return filteredData!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let filteredData = data.actions[data.presentUser]?.filter{$0.actionType == ActionType.sharing}
        
        guard let cell = recomendsTableView.dequeueReusableCell(withIdentifier: "FilmRecsTableViewCell", for: indexPath) as? FilmRecsTableViewCell else { return UITableViewCell() }
        
        guard let film = filteredData?[indexPath.row].film else { return UITableViewCell()}
        
        cell.setData(recsFilm: film)
        return cell
    }
}

extension FriendPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        245
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let filteredData = data.actions[data.presentUser]?.filter{$0.actionType == ActionType.sharing}
        tableView.deselectRow(at: indexPath, animated: true)
        let filmStoryboard = UIStoryboard(name: "Film",bundle: nil)
        guard let filmViewController = filmStoryboard.instantiateViewController(withIdentifier: "FilmViewController") as? FilmViewController else { return }
        
        guard let film = filteredData?[indexPath.row].film else { return }
        
        filmViewController.film = film
        present(filmViewController, animated: true)
    }
}
