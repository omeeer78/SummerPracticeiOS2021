//
//  FriendsViewController.swift
//  FriendsByLilya
//
//  Created by itisioslab on 06.07.2021.
//

import UIKit


class LilyaViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}

extension LilyaViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        96
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let friendPageViewController = storyboard?.instantiateViewController(identifier: "FriendPageViewController") as? FriendPageViewController else { return }
        friendPageViewController.friend = data.presentUser.friends[indexPath.row]
        navigationController?.pushViewController(friendPageViewController, animated: true)
    }
}

extension LilyaViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.presentUser.friends.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BigFriendsTableViewCell", for: indexPath) as? BigFriendsTableViewCell else { return UITableViewCell() }
        cell.setData(friend: data.presentUser.friends[indexPath.row])
        return cell

    }
}
