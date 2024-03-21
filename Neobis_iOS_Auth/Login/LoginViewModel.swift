//
//  LoginViewModel.swift
//  Neobis_iOS_Auth
//
//  Created by Игорь Пачкин on 17/3/24.
//


import Foundation

protocol LoginViewModelDelegate: AnyObject {
    func showTopNotification(message: String)
    func didCompleteLogin()
}

class LoginViewModel {
    weak var delegate: LoginViewModelDelegate?

    func signInButtonTapped() {
        // Обработка нажатия на кнопку "Регистрация"
    }

    func showHidePassword() {
        // Обработка нажатия на кнопку "Показать/скрыть пароль"
    }

    func loginButtonTapped(login: String?, password: String?) {
        guard let login = login, !login.isEmpty else {
            delegate?.showTopNotification(message: "Введите логин")
            return
        }
        
        guard let password = password, !password.isEmpty else {
            delegate?.showTopNotification(message: "Введите пароль")
            return
        }
        
        let userCredentials = LoginModel(email: login, password: password)
        loginRequest(user: userCredentials)
    }

    func loginRequest(user: LoginModel) {
        // Inside your LoginViewModel's loginRequest function:
        NetworkLayer.shared.login(loginCredentials: user) { [weak self] result in
            switch result {
            case .success(let authResponse):
                // If you need to save the token, do it here
                self?.delegate?.didCompleteLogin()
            case .failure(let error):
                // Handle the error scenario, perhaps informing the LoginViewController to show an error message
                //self?.delegate?.didEncounterError(error.localizedDescription)
                print("Упс, ошибка")
            }
        }
    }
}
