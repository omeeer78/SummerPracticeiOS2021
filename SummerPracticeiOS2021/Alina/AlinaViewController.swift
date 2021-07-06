//
//  AlinaViewController.swift
//  SummerPracticeiOS2021
//
//  Created by Марданов Амир on 03.07.2021.
//

import UIKit

class AlinaViewController: UIViewController {

    @IBOutlet weak var newsUITableView: UITableView!
    
    var actions: [Action] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
}

struct Action {
    var user: User
    var friend: User
}
