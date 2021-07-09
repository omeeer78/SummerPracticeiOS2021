//
//  RustemViewController.swift
//  SummerPracticeiOS2021
//
//  Created by Марданов Амир on 03.07.2021.
//

import UIKit

protocol NeededCheckListStatusDelegate: AnyObject {
    func openPage(page: Int)
}

class RustemViewController: UIViewController {
    
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var wantToWatchButton: UIButton!
    @IBOutlet weak var alreadyWatchedButton: UIButton!
    @IBOutlet weak var nowWatchingButton: UIButton!
    @IBOutlet weak var favoriteGenreLabel: UILabel!
    @IBOutlet weak var friendsButton: UIButton!
    weak var delegate: NeededCheckListStatusDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        imageImageView.image = data.users[0].image
        nicknameLabel.text = data.users[0].name
        let wantToWatchValue = data.users[0].checklist.filter{$0.status == Status.wantToWatch}.count
        let nowWatchingValue = data.users[0].checklist.filter{$0.status == Status.watching}.count
        let alreadyWatchedValue = data.users[0].checklist.filter{$0.status == Status.completed}.count
        wantToWatchButton.setTitle(String(wantToWatchValue), for: .normal)
        nowWatchingButton.setTitle(String(nowWatchingValue), for: .normal)
        alreadyWatchedButton.setTitle(String(alreadyWatchedValue), for: .normal)
        var genre = "всё"
        switch data.users[0].favoriteGenre {
        case Genre.action:
            genre = "экшн"
        case Genre.comedy:
            genre = "комедии"
        case Genre.drama:
            genre = "драмы"
        case Genre.horror:
            genre = "хорроры"
        case Genre.thriller:
            genre = "триллеры"
        }
        favoriteGenreLabel.text = genre
    }
    
    
    @IBAction func editProfileButtonItem(_ sender: UIBarButtonItem) {
        guard let editVC = storyboard?.instantiateViewController(withIdentifier: "EditViewController") else { return  }
        navigationController?.pushViewController(editVC, animated: true)
    }
    
    @IBAction func goToWatchListButton(_ sender: UIButton) {
        let watchlist = UIStoryboard(name: "Andrey", bundle: nil)
        guard let watchlistVC = watchlist.instantiateViewController(identifier: "ChecklistViewController") as? ChecklistViewController else { return }
        navigationController?.pushViewController(watchlistVC, animated: true)
    }
    
    @IBAction func goToAlreadyWatchedButton(_ sender: UIButton) {
        let alreadyWatched = UIStoryboard(name: "Andrey", bundle: nil)
       guard let alreadyWatchedVC = alreadyWatched.instantiateViewController(identifier: "ChecklistViewController") as? ChecklistViewController else { return }
        delegate = alreadyWatchedVC
        delegate?.openPage(page: 2)
        navigationController?.pushViewController(alreadyWatchedVC, animated: true)
        
    }
    
    @IBAction func goToNowWatchingButton(_ sender: UIButton) {
        let nowWatching = UIStoryboard(name: "Andrey", bundle: nil)
        guard let nowWatchingVC = nowWatching.instantiateViewController(withIdentifier: "ChecklistViewController") as? ChecklistViewController else { return }
        delegate = nowWatchingVC
        delegate?.openPage(page: 1)
        navigationController?.pushViewController(nowWatchingVC, animated: true)
        //nowWatchingVC.openChecklistPage(2)
    }
    
    @IBAction func goToFriendsButton(_ sender: UIButton) {
        
    }
    
}
