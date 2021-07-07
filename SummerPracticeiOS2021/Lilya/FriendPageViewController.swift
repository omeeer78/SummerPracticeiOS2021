//
//  FriendPageViewController.swift
//  SummerPracticeiOS2021
//
//  Created by itisioslab on 06.07.2021.
//

import UIKit

class FriendPageViewController: UIViewController {

    @IBOutlet weak var avaImage: UIImageView!
    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var favGenre: UILabel!
    
    @IBOutlet weak var watchedLabel: UILabel!
    @IBOutlet weak var watchingLabel: UILabel!
    @IBOutlet weak var wantwatchLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func substractionFunctionButtonPressed(sender: UIButton) {
        watchedLabel.text = "32"
    }
    
    @IBAction func watchingButtonFunction(_ sender: Any) {
        watchedLabel.text = "100"
    }
    
    @IBAction func wantToWatchButtonFuction(_ sender: Any) {
        wantwatchLabel.text = "45"
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
