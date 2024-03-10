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
        
        showTopNotification()
        buttonsTarge()
    }
    
    func buttonsTarge(){
        loginView.registrationButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }
    
    @objc func signInButtonTapped() {
        let vc = RegistrationViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showTopNotification() {
        let notificationView = TopNotificationView()
        view.addSubview(notificationView)
        
        notificationView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top) // Разместить уведомление вверху экрана
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(54) // Высота уведомления
        }
        
        // Анимируйте появление уведомления сверху экрана
        notificationView.transform = CGAffineTransform(translationX: 0, y: -notificationView.frame.height)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            notificationView.transform = .identity
        }) { _ in
            // Дополнительные действия после анимации, если необходимо
        }
        
        // Спустя некоторое время удаляйте уведомление
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UIView.animate(withDuration: 0.5, animations: {
                notificationView.alpha = 0
            }) { _ in
                notificationView.removeFromSuperview()
            }
        }
    }
}

