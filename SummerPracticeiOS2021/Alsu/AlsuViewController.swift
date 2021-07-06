//
// AlsuViewController.swift
// SummerPracticeiOS2021
//
// Created by Марданов Амир on 03.07.2021.
//

import UIKit

class AlsuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    
    var data:[Film] = [Film(title: "A Quiet Place Part II", director: "John Krasinski", annotation: "Following the events at home, the Abbott family now face the terrors of the outside world. Forced to venture into the unknown, they realize the creatures that hunt by sound are not the only threats lurking beyond the sand path.", image: UIImage(named: "quietplace2_324211") ?? UIImage(), rating: 7.5, genre: Genre.horror),
                       Film(title: "The Tomorrow War", director: "Chris McKay", annotation: "A family man is drafted to fight in a future war where the fate of humanity relies on his ability to confront the past.", image: UIImage(named: "the war is tomorrow") ?? UIImage(), rating: 6.7, genre: Genre.action),
                       Film(title: "Black Widow", director: "Cate Shortland", annotation: "A film about Natasha Romanoff in her quests between the films Civil War and Infinity War.", image: UIImage(named: "blackwidow_lob_crd_06") ?? UIImage(), rating: 6.7, genre: Genre.action)]
    
    var filteredData = [Film]()

    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Search"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 150
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FilmTableViewCell", for: indexPath) as? FilmTableViewCell else {return UITableViewCell() }
        cell.setData(film: filteredData[indexPath.row])
        return cell
    }
}
// MARK: Search Configurations

extension AlsuViewController:UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredData = []
        if searchText == "" {
            filteredData = data
        } else {
            for film in data {
                if film.title.lowercased().contains(searchText.lowercased()){
                    filteredData.append(film)
                }
            }
        }
        tableView.reloadData()
    }
}


