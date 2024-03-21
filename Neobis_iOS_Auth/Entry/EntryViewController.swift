//
//  EntryViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Игорь Пачкин on 20/3/24.
//

import UIKit
import SnapKit

class EntryViewController: UIViewController {
    
    let contentView = EntryView()
    
    override func loadView() {
        view = contentView
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actions()
    }
    
    func actions(){
        contentView.exitButton.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
    }
    
    
    @objc func exitButtonTapped() {
        // Создаем контроллер уведомления
        let alert = UIAlertController(title: "Выйти?", message: "Точно выйти?", preferredStyle: .alert)
        
        // Добавляем кнопки действий
        let confirmAction = UIAlertAction(title: "Да, точно", style: .destructive) { _ in
            self.dismiss(animated: true)
        }
        
        let cancelAction = UIAlertAction(title: "Нет, остаться", style: .cancel, handler: nil)
        
        // Добавляем действия к уведомлению
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        
        // Покажем уведомление
        present(alert, animated: true, completion: nil)
    }
}

