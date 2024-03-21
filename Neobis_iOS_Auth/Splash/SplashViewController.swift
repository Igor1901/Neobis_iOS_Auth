//
//  SplashViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Игорь Пачкин on 17/3/24.
//

import UIKit
import SnapKit

class SplashViewController: UIViewController {
    
    let contentView = SplashView()
    
    override func loadView() {
        view = contentView
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
