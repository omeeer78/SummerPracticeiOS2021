//
//  AlinaViewController.swift
//  SummerPracticeiOS2021
//
//  Created by Марданов Амир on 03.07.2021.
//

import UIKit

class AlinaViewController: UIViewController {
    
    @IBOutlet weak var newsUITableView: UITableView!
    
    var actions: [Action] = data.actions[data.presentUser] ?? []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Лента"
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
        filmViewController.film = actions[indexPath.row].film
        present(filmViewController, animated: true)
    }
}
