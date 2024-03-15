//
//  EmailView.swift
//  Neobis_iOS_Auth
//
//  Created by Игорь Пачкин on 12/3/24.
//

import UIKit

class EmailView: UIView {

    lazy var emailTitle: UILabel = {
       let label = UILabel()
       label.textAlignment = .center
       label.numberOfLines = 0
       label.font = UIFont(name: "MPLUS1p-Medium", size: 20)
       return label
   }()
   
   private let checkSpamTitle: UILabel = {
       let label = UILabel()
       label.text = "Если письмо не пришло, не спеши ждать совиную почту - лучше проверь ящик “Спам” \n \n (´｡• ω •｡`)"
       label.textAlignment = .center
       label.numberOfLines = 0
       label.font = UIFont(name: "MPLUS1p-Medium", size: 16)
       return label
   }()
   
   private let emainImage: UIImageView = {
       let imageView = UIImageView()
       imageView.image = UIImage(named: "EmailSendImage")
       return imageView
   }()
   
   let repeatEmailButton: UIButton = {
       let button = UIButton()
       button.setTitle("Письмо не пришло", for: .normal)
       button.backgroundColor = .clear
       button.setTitleColor(.black, for: .normal)
       return button
   }()
   
   override init(frame: CGRect) {
       super.init(frame: frame)
       backgroundColor = .white
       setupViews()
       setupConstraints()
       
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
    
    // MARK: - Setup
    
    private func setupViews() {
        addSubview(emailTitle)
        addSubview(checkSpamTitle)
        addSubview(emainImage)
        addSubview(repeatEmailButton)
    }
    
    private func setupConstraints() {
        emailTitle.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(36)
            make.leading.trailing.equalToSuperview().inset(31)
        }
        checkSpamTitle.snp.makeConstraints { make in
            make.top.equalTo(emailTitle.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(31)
        }
        emainImage.snp.makeConstraints { make in
            make.top.equalTo(checkSpamTitle.snp.bottom).offset(58)
            make.leading.trailing.equalToSuperview().inset(75)
        }
        repeatEmailButton.snp.makeConstraints { make in
            make.top.equalTo(emainImage.snp.bottom).offset(56)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
    }

}
