//
//  AndreyViewController.swift
//  SummerPracticeiOS2021
//
//  Created by Марданов Амир on 03.07.2021.
//

import UIKit

class ChecklistViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let data = Database().users[0].checklist
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    @IBAction func changeChecklistPage(_ sender: UISegmentedControl) {
        
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

extension ChecklistViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let filmViewController = storyboard?.instantiateViewController(identifier: "FilmViewController")as? FilmViewController else {
            return
        }
        filmViewController.film = data[indexPath.row].film
        present(filmViewController, animated: true)
    }
    
    
}

extension ChecklistViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListViewCell", for: indexPath) as? CheckListViewCell else {
            return UITableViewCell()
        }
        cell.setData(data[indexPath.row])
        return cell
    }
}
