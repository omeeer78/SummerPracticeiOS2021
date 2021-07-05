//
//  RustemViewController.swift
//  SummerPracticeiOS2021
//
//  Created by Марданов Амир on 03.07.2021.
//

import UIKit

class RustemViewController: UIViewController {

    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var wantToWatch: UIButton!
    @IBOutlet weak var alreadyWatched: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func editProfile(_ sender: UIBarButtonItem) {
        guard let editVC = storyboard?.instantiateViewController(withIdentifier: "EditViewController") else { return  }
        navigationController?.pushViewController(editVC, animated: true)
    }
    
    @IBAction func goToWatchList(_ sender: UIButton) {
        guard let watchList = storyboard?.instantiateViewController(withIdentifier: "EditViewController") else { return }
        navigationController?.pushViewController(watchList, animated: true)
    }
    
    @IBAction func goToAlreadyWatched(_ sender: UIButton) {
    }
    
    

}
