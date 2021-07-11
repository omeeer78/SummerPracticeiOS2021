//
//  FriendPageViewController.swift
//  SummerPracticeiOS2021
//
//  Created by itisioslab on 06.07.2021.
//

import UIKit

class FriendPageViewController: UIViewController {
    
    @IBOutlet weak var avaImageLabel: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var favGenreLabel: UILabel!
    @IBOutlet weak var recomendationsLabel: UILabel!
    
    @IBOutlet weak var watchedLabel: UILabel!
    @IBOutlet weak var watchingLabel: UILabel!
    @IBOutlet weak var wantwatchLabel: UILabel!
    
    @IBOutlet weak var recomendsTableView: UITableView!
    
    var friend: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recomendationsLabel.text = "Рекомендации " + friend.name //+ "'s"
        let watched: String = String(friend.checklist.filter{$0.status == Status.completed}.count)
        let watching: String = String(friend.checklist.filter{$0.status == Status.watching}.count)
        let wantWatch: String = String(friend.checklist.filter{$0.status == Status.wantToWatch}.count)
        watchedLabel.text = watched
        watchingLabel.text = watching
        wantwatchLabel.text = wantWatch
        avaImageLabel.image = friend.image
        nicknameLabel.text = friend.name
        var genre = "всё"
        switch friend.favoriteGenre {
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
        favGenreLabel.text = genre
        recomendsTableView.dataSource = self
        recomendsTableView.delegate = self
    }
    
}

extension FriendPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let userIndex = data.users.firstIndex(where: {$0 == friend}) else { return 0 }
        
        guard let filteredData = data.actions[data.users[userIndex]]?.filter({$0.actionType == ActionType.sharing}) else { return 0 }
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let userIndex = data.users.firstIndex(where: {$0 == friend}) else { return UITableViewCell()}
        
        let filteredData = data.actions[data.users[userIndex]]?.filter{$0.actionType == ActionType.sharing}
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
        
        guard let userIndex = data.users.firstIndex(where: {$0 == friend}) else { return }
        
        let filteredData = data.actions[data.users[userIndex]]?.filter{$0.actionType == ActionType.sharing}
        tableView.deselectRow(at: indexPath, animated: true)
        let filmStoryboard = UIStoryboard(name: "Film",bundle: nil)
        guard let filmViewController = filmStoryboard.instantiateViewController(withIdentifier: "FilmViewController") as? FilmViewController else { return }
        
        guard let film = filteredData?[indexPath.row].film else { return }
        
        filmViewController.film = film
        present(filmViewController, animated: true)
    }
}
