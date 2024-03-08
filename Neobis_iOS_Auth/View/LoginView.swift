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
        //searchView.layer.borderWidth = 0.5
        //searchView.layer.borderColor = UIColor(red: 0.762, green: 0.762, blue: 0.762, alpha: 1).cgColor
        //searchView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        //searchView.layer.shadowOpacity = 1
        //searchView.layer.shadowRadius = 3
        //searchView.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        return view
    }()
    
    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your login here"
        textField.textColor = UIColor(red: 118/255, green: 118/255, blue: 118/255, alpha: 1)
        return textField
    }()
    
    lazy var passwordView: UIView = {
        let searchView = UIView()
        searchView.backgroundColor = .white
        searchView.layer.cornerRadius = 5
        searchView.layer.borderWidth = 0.5
        searchView.layer.borderColor = UIColor(red: 0.762, green: 0.762, blue: 0.762, alpha: 1).cgColor
        searchView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        searchView.layer.shadowOpacity = 1
        searchView.layer.shadowRadius = 3
        searchView.layer.shadowOffset = CGSize(width: 0, height: 1)
        return searchView
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let showHidePasswordButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "eye_icon"), for: .normal)
        button.addTarget(self, action: #selector(showHidePassword), for: .touchUpInside)
        return button
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("I don't have an account", for: .normal)
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
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
        addSubview(passwordTextField)
        addSubview(showHidePasswordButton)
        addSubview(loginButton)
        addSubview(signUpButton)
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
            //make.top.equalTo(welcomeLabel.snp.bottom).offset(20)
            //make.leading.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
            make.leading.equalTo(16)
            make.trailing.equalTo(-48)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(loginView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        showHidePasswordButton.snp.makeConstraints { make in
            make.trailing.equalTo(passwordTextField.snp.trailing)
            make.centerY.equalTo(passwordTextField.snp.centerY)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        signUpButton.snp.makeConstraints { make in
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
    
    @objc private func signUpButtonTapped() {
        // Handle sign up button tapped
    }
}

