//
//  RecommendViewController.swift
//  SummerPracticeiOS2021
//
//  Created by itisioslab on 09.07.2021.
//

import UIKit

class RecommendViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var friendsList: [User] = data.presentUser.friends
    var filmToRecommend : Film?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension RecommendViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let film = filmToRecommend else { return }
        
        data.actionHappened(friend: friendsList[indexPath.row], film: film, type: ActionType.sharing)
        
        
        self.dismiss(animated: true, completion: nil)
    }
}

extension RecommendViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friendsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendViewCell", for: indexPath) as? RecommendViewCell else {
            return UITableViewCell()
        }
        cell.setData(friendsList[indexPath.row])
        return cell
    }
}
