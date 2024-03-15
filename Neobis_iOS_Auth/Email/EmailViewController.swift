//
//  EmailViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Игорь Пачкин on 12/3/24.
//

import UIKit

class EmailViewController: UIViewController {

    
    let contentView = EmailView()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

}
