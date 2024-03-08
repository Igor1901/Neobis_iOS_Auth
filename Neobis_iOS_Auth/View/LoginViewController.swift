//
//  LoginViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Игорь Пачкин on 7/3/24.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }


}

