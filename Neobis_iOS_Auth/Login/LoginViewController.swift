//
//  LoginViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Игорь Пачкин on 7/3/24.
//

// LoginViewController.swift

import UIKit

class LoginViewController: UIViewController, LoginViewModelDelegate {

    let loginView = LoginView()
    var viewModel = LoginViewModel()
    
    let networkLayer = NetworkLayer()
    //networkLayer.delegate = self

    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        networkLayer.delegate = self
        viewModel.delegate = self
        buttonsTarge()
    }
    
    func buttonsTarge(){
        loginView.registrationButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        loginView.showHidePasswordButton.addTarget(self, action: #selector(showHidePassword), for: .touchUpInside)
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc func signInButtonTapped() {
        //let vc = RegistrationViewController()
        //let vc = WelcomeViewController()
        //navigationController?.pushViewController(vc, animated: true)
        
        let myModalViewController = EntryViewController()
        myModalViewController.modalPresentationStyle = .fullScreen
        self.present(myModalViewController, animated: true, completion: nil)

        //present(WelcomeViewController(), animated: true)
    }
    
    @objc private func showHidePassword() {
        loginView.passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc func loginButtonTapped() {
        
        viewModel.loginButtonTapped(login: loginView.loginTextField.text, password: loginView.passwordTextField.text)
    }

    // MARK: - LoginViewModelDelegate
    func showTopNotification(message: String) {
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


extension LoginViewController: NetworkLayerDelegate {
    func didCompleteLogin(success: Bool) {
        print("didCompleteLogin called with success: \(success)")
        if success {
            // Переход на EntryViewController
            DispatchQueue.main.async {
                let myModalViewController = EntryViewController()
                myModalViewController.modalPresentationStyle = .fullScreen
                self.present(myModalViewController, animated: true) {
                    print("EntryViewController presented")
                }
            }
        } else {
            // Ошибка входа, показать уведомление
            DispatchQueue.main.async {
                self.showTopNotification(message: "Ошибка входа")
            }
        }
    }
}

