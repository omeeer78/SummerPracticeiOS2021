//
//  AndreyViewController.swift
//  SummerPracticeiOS2021
//
//  Created by Марданов Амир on 03.07.2021.
//

import UIKit

class ChecklistViewController: UIViewController {
    
    @IBOutlet weak var segmentedControll: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    var checklistData: [ChecklistCellModel] = data.presentUser.checklist
    var currentStatus = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        openChecklistPage(currentStatus)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checklistData = data.presentUser.checklist
        tableView.reloadData()
    }
    
    
    @IBAction func changeChecklistPage(_ sender: UISegmentedControl) {
        openChecklistPage(sender.selectedSegmentIndex)
    }
    
    
    func openChecklistPage(_ page: Int){
        currentStatus = page
        checklistData = data.presentUser.checklist
        tableView.reloadData()
        segmentedControll.selectedSegmentIndex = page
    }
}

extension ChecklistViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let filteredChecklists = checklistData.filter{ $0.status.rawValue == currentStatus }
        
        let filmStoryboard = UIStoryboard(name: "Film",bundle: nil)
        guard let filmViewController = filmStoryboard.instantiateViewController(identifier: "FilmViewController")as? FilmViewController else {return}
        filmViewController.film = filteredChecklists[indexPath.row].film
        filmViewController.delegate = self
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
        let filteredChecklists = checklistData.filter{ $0.status.rawValue == currentStatus }
        cell.setData(filteredChecklists[indexPath.row])
        return cell
    }
}

extension ChecklistViewController: FilmViewControllerDelegate {
    func reloadTable(page: Int) {
        checklistData = data.presentUser.checklist
        openChecklistPage(page)
    }
}

extension ChecklistViewController: NeededCheckListStatusDelegate {
    func openPage(page: Int) {
        currentStatus = page
    }
}
