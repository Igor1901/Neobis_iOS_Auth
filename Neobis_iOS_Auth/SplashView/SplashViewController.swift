//
//  SplashViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Игорь Пачкин on 17/3/24.
//

import UIKit
import SnapKit

class SplashViewController: UIViewController {
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        // Добавьте любой дизайн вашего экрана загрузки
        let welcomeLabel: UILabel = {
            let label = UILabel()
            label.text = "Lorby "
            label.textAlignment = .center
            label.font = UIFont(name: "MPLUS1p-Black", size: 40)
            return label
        }()
        
        let logoImageView = UIImageView(image: UIImage(named: "logo"))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeLabel)
        view.addSubview(logoImageView)
        
        
        
        
        
        NSLayoutConstraint.activate([
            
            
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Здесь вы можете добавить код для анимации или других действий при загрузке
        // Запускаем таймер, который вызовет метод перехода через определенное время
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.navigateToMainScreen()
        }
    }
    
    func navigateToMainScreen() {
        let mainViewController = LoginViewController() // Замените на ваш главный экран
        let navigationController = UINavigationController(rootViewController: mainViewController)
        navigationController.modalPresentationStyle = .fullScreen
        UIApplication.shared.windows.first?.rootViewController = navigationController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
