//
//  AndreyViewController.swift
//  SummerPracticeiOS2021
//
//  Created by Марданов Амир on 03.07.2021.
//

import UIKit

class ChecklistViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var checklistData:[ChecklistCellModel] = data.users[0].checklist
    var currentStatus = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    @IBAction func changeChecklistPage(_ sender: UISegmentedControl) {
        openChecklistPage(sender.selectedSegmentIndex)
    }
    
    
    func openChecklistPage(_ page: Int){
        currentStatus = page
        tableView.reloadData()
    }
}

extension ChecklistViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let filmStoryboard = UIStoryboard(name: "Film",bundle: nil)
        
        guard let filmViewController = filmStoryboard.instantiateViewController(identifier: "FilmViewController")as? FilmViewController else {return}
        filmViewController.film = checklistData[indexPath.row].film
        present(filmViewController, animated: true, completion: nil)
    }
    
}

extension ChecklistViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        checklistData.filter{ $0.status.rawValue == currentStatus }.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListViewCell", for: indexPath) as? CheckListViewCell else {
            return UITableViewCell()
        }
        cell.setData(checklistData[indexPath.row])
        return cell
    }
}
