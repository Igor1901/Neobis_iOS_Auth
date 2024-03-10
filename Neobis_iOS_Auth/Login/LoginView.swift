//
//  LoginView.swift
//  Neobis_iOS_Auth
//
//  Created by Игорь Пачкин on 7/3/24.
//


import UIKit
import SnapKit

class LoginView: UIView {

    // MARK: - Properties
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Group 10")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Вэлком бэк!"
        label.textAlignment = .center
        label.font = UIFont(name: "MPLUS1p-Medium", size: 24)
        return label
    }()
    
    lazy var loginView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        return view
    }()
    
    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введи туда-сюда логин"
        textField.font = UIFont(name: "MPLUS1p-Medium", size: 16)
        textField.textColor = UIColor(red: 118/255, green: 118/255, blue: 118/255, alpha: 1)
        return textField
    }()
    
    lazy var passwordView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        return view
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль (тоже введи)"
        textField.isSecureTextEntry = true
        textField.font = UIFont(name: "MPLUS1p-Medium", size: 16)
        textField.textColor = UIColor(red: 118/255, green: 118/255, blue: 118/255, alpha: 1)
        return textField
    }()
    
    
    private let showHidePasswordButton: SecurityButton = {
        let button = SecurityButton()
        button.setupButton()
        button.addTarget(self, action: #selector(showHidePassword), for: .touchUpInside)
        return button
    }()

    
    
     let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = UIFont(name: "MPLUS1p-Medium", size: 16)
        button.tintColor = .white
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
     let registrationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("У меня еще нет аккаунта", for: .normal)
        button.titleLabel?.font = UIFont(name: "MPLUS1p-Medium", size: 16)
        button.tintColor = .black
        return button
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupViews() {
        addSubview(imageView)
        addSubview(welcomeLabel)
        addSubview(loginView)
        loginView.addSubview(loginTextField)
        //addSubview(loginTextField)
        addSubview(passwordView)
        passwordView.addSubview(passwordTextField)
        passwordView.addSubview(showHidePasswordButton)
        addSubview(loginButton)
        addSubview(registrationButton)
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).offset(24)
            make.width.equalTo(187)
            make.height.equalTo(194)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(31.85)
        }
        
        loginView.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(28)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(52)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(16)
            make.trailing.equalTo(-48)
        }
        
        passwordView.snp.makeConstraints { make in
            make.top.equalTo(loginView.snp.bottom).offset(14)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(52)
            
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(16)
            make.trailing.equalTo(-48)
        }
        
        showHidePasswordButton.snp.makeConstraints { make in
            make.trailing.equalTo(-8)
            make.centerY.equalToSuperview()
            make.width.equalTo(32)
            make.height.equalTo(32)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
        registrationButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    
    @objc private func showHidePassword() {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc private func loginButtonTapped() {
        // Handle login button tapped
    }
    

}

