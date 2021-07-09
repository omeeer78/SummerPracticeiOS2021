//
//  AlinaViewController.swift
//  SummerPracticeiOS2021
//
//  Created by Марданов Амир on 03.07.2021.
//

import UIKit

class AlinaViewController: UIViewController {
    
    @IBOutlet weak var newsUITableView: UITableView!
    
//    override func viewWillAppear(_ animated: Bool) {
//        let test = Database()
//        actions.append(Action(friend: test.users[1], recommendedFilm: test.films[1], actionType: ActionType.haveWatched))
//        actions.append(Action(friend: test.users[2], recommendedFilm: test.films[3], actionType: ActionType.sharing))
//        actions.append(Action(friend: test.users[3], recommendedFilm: test.films[7], actionType: ActionType.sharing))
//        actions.append(Action(friend: test.users[4], recommendedFilm: test.films[0], actionType: ActionType.sharing))
//    }
    
    var actions: [Action] = data.actions[data.presentUseer] ?? [(Action(friend: data.users[1], recommendedFilm: data.films[1], actionType: ActionType.haveWatched)),
                                                                    (Action(friend: data.users[2], recommendedFilm: data.films[3], actionType: ActionType.sharing)),
                                                                    (Action(friend: data.users[3], recommendedFilm: data.films[7], actionType: ActionType.sharing)),
                                                                    (Action(friend: data.users[4], recommendedFilm: data.films[0], actionType: ActionType.sharing))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        newsUITableView.dataSource = self
        newsUITableView.delegate = self
    }
}

extension AlinaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        actions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShareNewsUITableViewCell", for: indexPath) as? ShareNewsUITableViewCell else {
            return UITableViewCell()
        }
        cell.setData(action: actions[indexPath.row])
        return cell
    }
}

extension AlinaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        362
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let filmStoryboard = UIStoryboard(name: "Film",bundle: nil)
        
        guard let filmViewController = filmStoryboard.instantiateViewController(withIdentifier: "FilmViewController") as? FilmViewController else { return }
        filmViewController.film = actions[indexPath.row].recommendedFilm
        present(filmViewController, animated: true)
    }
}
