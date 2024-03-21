//
//  RegistrationViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Игорь Пачкин on 10/3/24.
//

import UIKit

class RegistrationViewController: UIViewController {

    let contentView = RegistrationView()
    let viewModel: RegistrationViewModelProtocol = RegistrationViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        buttonsTarge()
        contentView.delegate = self
 
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

    func buttonsTarge(){
        contentView.nextButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        contentView.showHidePasswordButton.addTarget(self, action: #selector(showHidePassword), for: .touchUpInside)
        contentView.showHideRepeatPasswordButton.addTarget(self, action: #selector(showHideRepeatPassword), for: .touchUpInside)
        contentView.passwordTextField.addTarget(self, action: #selector(passwordChanged), for: .editingChanged)
        contentView.nextButton.addTarget(self, action: #selector(nextButtonTappedd), for: .touchUpInside)
    }
    
    @objc func signInButtonTapped() {
        let vc = EmailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func showHidePassword() {
        contentView.passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc private func showHideRepeatPassword() {
        contentView.repeatPasswordTextField.isSecureTextEntry.toggle()
    }
    
    @objc func passwordChanged(_ textField: UITextField) {
        if let password = textField.text {
            contentView.delegate?.check(password: password)
        }
    }
    
    @objc func nextButtonTappedd() {
        guard let username = contentView.loginTextField.text, !username.isEmpty else {
            // Если поле для имени пользователя пустое или nil, выводим сообщение об ошибке или предпринимаем другие действия по вашему усмотрению
            print("Поле 'Имя пользователя' не должно быть пустым")
            return
        }
        
        guard let email = contentView.emailTextField.text, !email.isEmpty else {
            // Если поле для адреса электронной почты пустое или nil, выводим сообщение об ошибке или предпринимаем другие действия по вашему усмотрению
            print("Поле 'Email' не должно быть пустым")
            return
        }
        
        guard let password = contentView.passwordTextField.text, !password.isEmpty else {
            // Если поле для пароля пустое или nil, выводим сообщение об ошибке или предпринимаем другие действия по вашему усмотрению
            print("Поле 'Пароль' не должно быть пустым")
            return
        }
        
        guard let repeatPassword = contentView.repeatPasswordTextField.text, !password.isEmpty else {
            // Если поле для пароля пустое или nil, выводим сообщение об ошибке или предпринимаем другие действия по вашему усмотрению
            print("Поле 'Пароль' не должно быть пустым")
            return
        }
        
        // Если все поля заполнены, создаем объект UserCredentials и передаем его делегату
        let user = RegistrationModel(username: username, email: email, password: password, passwordConfirm: repeatPassword)
        contentView.delegate?.nextButtonTapped(user: user)
    }
    
    

}

extension RegistrationViewController: RegistrationContentViewDelegate {
    func check(password: String) {
        contentView.setupCheckValidLabels(withStates: viewModel.check(password: password))
        
    }
    
    func nextButtonTapped(user: RegistrationModel) {
        viewModel.nextButtonTapped(user: user) { result in
            print("Не получилось зарегать")
        }
        let viewController = EmailViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
