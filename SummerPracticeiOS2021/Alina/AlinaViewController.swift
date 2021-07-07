//
//  AlinaViewController.swift
//  SummerPracticeiOS2021
//
//  Created by Марданов Амир on 03.07.2021.
//

import UIKit

class AlinaViewController: UIViewController {

    @IBOutlet weak var newsUITableView: UITableView!
    
    var actions: [Action] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let test = Database()
        actions.append(Action(user: test.users[0], friend: test.users[2], recommendedFilm: test.films[3]))
        actions.append(Action(user: test.users[0], friend: test.users[3], recommendedFilm: test.films[7]))
        actions.append(Action(user: test.users[0], friend: test.users[4], recommendedFilm: test.films[0]))
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
        cell.setData(film: actions[indexPath.row].recommendedFilm,
                     friend: actions[indexPath.row].friend)
        return cell
    }
}

extension AlinaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        362
    }
    
//заменить AlinaViewController на экран фильма, это модальный переход на него
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        guard let alinaViewController = storyboard?.instantiateViewController(withIdentifier: "AlinaViewController") as? AlinaViewController else { return }
//    alinaViewController.film = фсешщты[indexPath.row].film
//    present(alinaViewController, animated: true)
    }
}



struct Action {
    var user: User
    var friend: User
    var recommendedFilm: Film
}
