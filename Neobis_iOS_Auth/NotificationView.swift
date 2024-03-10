//
//  NotificationView.swift
//  Neobis_iOS_Auth
//
//  Created by Игорь Пачкин on 9/3/24.
//

import UIKit
import SnapKit

class TopNotificationView: UIView {
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Неверный логин или пароль"
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = .white
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
        
        addSubview(messageLabel)
        
        messageLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(15)
            make.left.right.equalToSuperview().inset(16)
        }
    }
}

