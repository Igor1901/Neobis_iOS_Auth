//
//  LoginViewModel.swift
//  Neobis_iOS_Auth
//
//  Created by Игорь Пачкин on 17/3/24.
//


import Foundation

protocol LoginViewModelDelegate: AnyObject {
    func showTopNotification(message: String)
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
        
        let userCredentials = LoginModel(login: login, password: password)
        loginRequest(user: userCredentials)
    }

    func loginRequest(user: LoginModel) {
        NetworkLayer.shared.login(loginCredentials: user) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let authResponse):
                    // Действия при успешном входе
                    print("Успешный вход")
                case .failure(let error):
                    // Действия при ошибке
                    print("Ошибка при входе: \(error.localizedDescription)")
                }
            }
        }
    }
}
