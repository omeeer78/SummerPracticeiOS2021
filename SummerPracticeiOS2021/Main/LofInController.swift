//
//  ViewController.swift
//  Contacts
//
//  Created by Alina Bikkinina on 02.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInAction(_ sender: Any) {
        
        
        guard let nickname = nicknameTextField.text,
              let password = passwordTextField.text
        else { return }
        
        let user = data.users.first{$0.name == nickname}
        
//        data.users.flatMap{Dictionary(grouping: $0.name, by: $0.password)}
        
        if user != nil && user?.password == password{
            
            guard let user = user else { return }
            data.presentUser = user
            
            guard let tableViewController = storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else { return }
            
            navigationController?.pushViewController(tableViewController, animated: true)
        }
    }
    
}
