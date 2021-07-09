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
    @IBOutlet weak var recommendedMovieLabel: UILabel!
    @IBOutlet weak var recommendedMovieImageView: UIImageView!
    @IBOutlet weak var randomRecommendationLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        imageImageView.image = data.presentUser.image
        nicknameLabel.text = data.presentUser.name
        let wantToWatchValue = data.presentUser.checklist.filter{$0.status == Status.wantToWatch}.count
        let nowWatchingValue = data.presentUser.checklist.filter{$0.status == Status.watching}.count
        let alreadyWatchedValue = data.presentUser.checklist.filter{$0.status == Status.completed}.count
        wantToWatchButton.setTitle(String(wantToWatchValue), for: .normal)
        nowWatchingButton.setTitle(String(nowWatchingValue), for: .normal)
        alreadyWatchedButton.setTitle(String(alreadyWatchedValue), for: .normal)
        var genre = "всё"
        switch data.presentUser.favoriteGenre {
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
        let randomMovie = data.actions[data.presentUser]?.filter{$0.actionType == ActionType.sharing}.randomElement()?.film ?? data.films.randomElement()
        recommendedMovieLabel.text = randomMovie?.title
        recommendedMovieImageView.image = randomMovie?.image
        let friendsCount = "Друзей: \(data.presentUser.friends.count)"
        friendsButton.setTitle(String(friendsCount), for: .normal)
    }
    
    
    @IBAction func editProfileButtonItem(_ sender: UIBarButtonItem) {
        guard let editVC = storyboard?.instantiateViewController(withIdentifier: "EditViewController") else { return }
        navigationController?.pushViewController(editVC, animated: true)
    }
    
    @IBAction func goToWatchListButton(_ sender: UIButton) {
        let watchlist = UIStoryboard(name: "Andrey", bundle: nil)
        guard let watchlistVC = watchlist.instantiateViewController(identifier: "ChecklistViewController") as? ChecklistViewController else { return }
        navigationController?.pushViewController(watchlistVC, animated: true)
    }
    
    @IBAction func goToNowWatchingButton(_ sender: UIButton) {
        let nowWatching = UIStoryboard(name: "Andrey", bundle: nil)
        guard let nowWatchingVC = nowWatching.instantiateViewController(withIdentifier: "ChecklistViewController") as? ChecklistViewController else { return }
        delegate = nowWatchingVC
        delegate?.openPage(page: 1)
        navigationController?.pushViewController(nowWatchingVC, animated: true)
    }
    
    @IBAction func goToAlreadyWatchedButton(_ sender: UIButton) {
        let alreadyWatched = UIStoryboard(name: "Andrey", bundle: nil)
        guard let alreadyWatchedVC = alreadyWatched.instantiateViewController(identifier: "ChecklistViewController") as? ChecklistViewController else { return }
        delegate = alreadyWatchedVC
        delegate?.openPage(page: 2)
        navigationController?.pushViewController(alreadyWatchedVC, animated: true)
    }
    
    
    @IBAction func goToFriendsButton(_ sender: UIButton) {
        let friendsList = UIStoryboard(name: "Lilya", bundle: nil)
        guard let friendsListVC = friendsList.instantiateViewController(withIdentifier: "LilyaViewController") as? LilyaViewController else { return }
        navigationController?.pushViewController(friendsListVC, animated: true)
    }
    
    @IBAction func goToTheMovieButton (_ sender: Any){
        let recommendedMovieStoryboard = UIStoryboard(name: "Film", bundle: nil)
        guard let movieVC = recommendedMovieStoryboard.instantiateViewController(withIdentifier: "FilmViewController") as? FilmViewController else { return }
        let recommendedMovie = data.films.filter{$0.title == recommendedMovieLabel.text}.first
        movieVC.film = recommendedMovie
        movieVC.delegate = self
        present(movieVC, animated: true)
    }
    
}

extension RustemViewController:FilmViewControllerDelegate{
    func reloadTable(page: Int) {
        let wantToWatchValue = data.presentUser.checklist.filter{$0.status == Status.wantToWatch}.count
        let nowWatchingValue = data.presentUser.checklist.filter{$0.status == Status.watching}.count
        let alreadyWatchedValue = data.presentUser.checklist.filter{$0.status == Status.completed}.count
        wantToWatchButton.setTitle(String(wantToWatchValue), for: .normal)
        nowWatchingButton.setTitle(String(nowWatchingValue), for: .normal)
        alreadyWatchedButton.setTitle(String(alreadyWatchedValue), for: .normal)
    }
}
