//
//  RegistrationViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Игорь Пачкин on 10/3/24.
//

import UIKit

class RegistrationViewController: UIViewController {

    let loginView = RegistrationView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
    }

    func setupNavigationBar() {
        // Устанавливаем цвет стрелки "назад" в черный
        navigationController?.navigationBar.tintColor = .black

        // Создаем кастомный заголовок
        let titleLabel = UILabel()
        titleLabel.text = "Регистрация"
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "MPLUS1p-Medium", size: 16)
        navigationItem.titleView = titleLabel
        
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
