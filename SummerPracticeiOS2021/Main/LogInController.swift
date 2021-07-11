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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nicknameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func signInAction(_ sender: Any) {
        
        guard let nickname = nicknameTextField.text,
              let password = passwordTextField.text
        else { return }
        
        guard let user = data.users.first(where: { $0.name == nickname })
        else { return }
        
        if user.password == password {
            
            data.presentUser = user
            
            guard let tableViewController = storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else { return }
            
            navigationController?.pushViewController(tableViewController, animated: true)
        }
    }
}
