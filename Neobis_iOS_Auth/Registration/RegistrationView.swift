//
//  RegistrationView.swift
//  Neobis_iOS_Auth
//
//  Created by Игорь Пачкин on 10/3/24.
//

import UIKit
import SnapKit

class RegistrationView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Создать аккаунт \n Lorby"
        label.font = UIFont(name: "MPLUS1p-Medium", size: 24)!
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var emailView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        return view
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "MPLUS1p-Medium", size: 16)!
        textField.attributedPlaceholder = NSAttributedString(
            string: "Введи адрес почты",
            attributes: [
                NSAttributedString.Key.font: UIFont(name: "MPLUS1p-Medium", size: 16)!,
                NSAttributedString.Key.foregroundColor: UIColor.gray
            ]
        )
        
        return textField
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
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "MPLUS1p-Medium", size: 16)!
        textField.attributedPlaceholder = NSAttributedString(
            string: "Придумай логин",
            attributes: [
                NSAttributedString.Key.font: UIFont(name: "MPLUS1p-Medium", size: 16)!,
                NSAttributedString.Key.foregroundColor: UIColor.gray
            ]
        )
        
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
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "MPLUS1p-Medium", size: 16)!
        textField.isSecureTextEntry = true
        textField.attributedPlaceholder = NSAttributedString(
            string: "Создай пароль",
            attributes: [
                NSAttributedString.Key.font: UIFont(name: "MPLUS1p-Medium", size: 16)!,
                NSAttributedString.Key.foregroundColor: UIColor.gray
            ]
        )
        
        return textField
    }()
    
    private let showHidePasswordButton: SecurityButton = {
        let button = SecurityButton()
        button.setupButton()
        button.addTarget(self, action: #selector(showHidePassword), for: .touchUpInside)
        return button
    }()
    
    let passwordLenthLabel: UILabel = {
        let label = UILabel()
        label.text = "· От 8 до 15 символов"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)!
        label.textColor = .gray
        
        return label
    }()
    
    let passwordRegistrLabel: UILabel = {
        let label = UILabel()
        label.text = "· Строчные и прописные буквы"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)!
        label.textColor = .gray
        
        return label
    }()
    
    let passwordContainIntLabel: UILabel = {
        let label = UILabel()
        label.text = "· Минимум 1 цифра"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)!
        label.textColor = .gray
        
        return label
    }()
    
    let passwordContainSpecSymbolLabel: UILabel = {
        let label = UILabel()
        label.text = "· Минимум 1 спецсимвол (!, #, $...)"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)!
        label.textColor = .gray
        
        return label
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    lazy var repeatpasswordView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        return view
    }()
    
    private let repeatPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "MPLUS1p-Medium", size: 16)!
        textField.isSecureTextEntry = true
        textField.attributedPlaceholder = NSAttributedString(
            string: "Повтори пароль",
            attributes: [
                NSAttributedString.Key.font: UIFont(name: "MPLUS1p-Medium", size: 16)!,
                NSAttributedString.Key.foregroundColor: UIColor.gray
            ]
        )
        
        return textField
    }()
    
    private let showHideRepeatPasswordButton: SecurityButton = {
        let button = SecurityButton()
        button.setupButton()
        button.addTarget(self, action: #selector(showHideRepeatPassword), for: .touchUpInside)
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Далее", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(titleLabel)
        
        addSubview(emailView)
        emailView.addSubview(emailTextField)
        
        addSubview(loginView)
        loginView.addSubview(loginTextField)
        
        addSubview(passwordView)
        passwordView.addSubview(passwordTextField)
        passwordView.addSubview(showHidePasswordButton)
        
        addSubview(stackView)
        stackView.addArrangedSubview(passwordLenthLabel)
        stackView.addArrangedSubview(passwordRegistrLabel)
        stackView.addArrangedSubview(passwordContainIntLabel)
        stackView.addArrangedSubview(passwordContainSpecSymbolLabel)
        
        addSubview(repeatpasswordView)
        repeatpasswordView.addSubview(repeatPasswordTextField)
        repeatpasswordView.addSubview(showHideRepeatPasswordButton)
        
        addSubview(nextButton)
    }
    
    private func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(40)
            make.leading.trailing.equalToSuperview().inset(51)
        }
        
        emailView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(52)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(16)
            make.trailing.equalTo(-48)
        }
        
        loginView.snp.makeConstraints { make in
            make.top.equalTo(emailView.snp.bottom).offset(14)
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
            make.trailing.equalTo(-10)
            make.centerY.equalToSuperview()
            make.width.equalTo(32)
            make.height.equalTo(32)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(passwordView.snp.bottom).offset(6)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(80)
        }
        
        repeatpasswordView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(14)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(52)
        }
        repeatPasswordTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(16)
            make.trailing.equalTo(-48)
        }
        
        showHideRepeatPasswordButton.snp.makeConstraints { make in
            make.trailing.equalTo(-10)
            make.centerY.equalToSuperview()
            make.width.equalTo(32)
            make.height.equalTo(32)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(repeatpasswordView.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
    }
    
    @objc private func showHidePassword() {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc private func showHideRepeatPassword() {
        passwordTextField.isSecureTextEntry.toggle()
    }
}
