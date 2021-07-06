//
//  FriendsViewController.swift
//  FriendsByLilya
//
//  Created by itisioslab on 06.07.2021.
//

import UIKit


class LilyaViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    
    let Data: [FriendsCellData] = [FriendsCellData(name: "ass",
                                                   image: UIImage(systemName: "face.dashed.fill") ?? UIImage()),
                                   FriendsCellData(name: "ass",
                                                    image: UIImage(systemName: "face.dashed.fill") ?? UIImage()),
                                   FriendsCellData(name: "ass",
                                                    image: UIImage(systemName: "face.dashed.fill") ?? UIImage()),
                                   FriendsCellData(name: "ass",
                                                    image: UIImage(systemName: "face.dashed.fill") ?? UIImage()),
                                   FriendsCellData(name: "ass",
                                                    image: UIImage(systemName: "face.dashed.fill") ?? UIImage()),
                                   FriendsCellData(name: "ass",
                                                    image: UIImage(systemName: "face.dashed.fill") ?? UIImage()),
                                   FriendsCellData(name: "ass",
                                                    image: UIImage(systemName: "face.dashed.fill") ?? UIImage()),
                                   FriendsCellData(name: "ass",
                                                    image: UIImage(systemName: "face.dashed.fill") ?? UIImage()),
                                   FriendsCellData(name: "ass",
                                                    image: UIImage(systemName: "face.dashed.fill") ?? UIImage()),
                                   FriendsCellData(name: "ass",
                                                    image: UIImage(systemName: "face.dashed.fill") ?? UIImage())]


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

struct FriendsCellData {
      var name: String
      var image: UIImage
      //var favoriteGenre: Genre
      //var friends: [User]
      //var checklist: [ChecklistCell]
}

extension LilyaViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        96
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(FriendPageViewController(), animated: true)
    }
}

extension LilyaViewController: UITableViewDataSource{
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BigFriendsTableViewCell", for: indexPath) as? BigFriendsTableViewCell else { return UITableViewCell() }
        cell.SetData(friend: Data[indexPath.row])
        return cell
        
}
}
