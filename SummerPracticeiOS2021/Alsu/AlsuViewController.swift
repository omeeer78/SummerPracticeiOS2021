//
// AlsuViewController.swift
// SummerPracticeiOS2021
//
// Created by Марданов Амир on 03.07.2021.
//

import UIKit

class AlsuViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var filteredFilms = [Film]()
    var films = data.films

    let searchController = UISearchController(searchResultsController: nil)
    let filmStoryboard = UIStoryboard(name: "Film", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Поиск"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 150
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Введите название или режиссера"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
}

// MARK: DataSource

extension AlsuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return filteredFilms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FilmTableViewCell", for: indexPath) as? FilmTableViewCell else {return UITableViewCell() }
        cell.setData(film: filteredFilms[indexPath.row])
        return cell
    }
}

// MARK: Delegate

extension AlsuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let filmViewController = filmStoryboard.instantiateViewController(identifier: "FilmViewController") as? FilmViewController else { return }
        
        filmViewController.film = filteredFilms[indexPath.row]
        present(filmViewController, animated: true, completion: nil)
    }
}

// MARK: Search Configurations

extension AlsuViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        filterContentForSearchText(text)
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredFilms = []
        if searchText == "" {
            filteredFilms = films
        } else {
            for film in films {
                if film.title.lowercased().contains(searchText.lowercased()) || film.director.lowercased().contains(searchText.lowercased()) {
                    filteredFilms.append(film)
                }
            }
        }
        tableView.reloadData()
    }
}


