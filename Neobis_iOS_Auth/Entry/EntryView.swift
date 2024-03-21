//
//  EntryView.swift
//  Neobis_iOS_Auth
//
//  Created by Игорь Пачкин on 20/3/24.
//

import UIKit
import SnapKit

class EntryView: UIView {

    let welcomeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "illustration") // Замените на название вашего изображения
        return imageView
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
            label.numberOfLines = 0
            label.textAlignment = .center
            let attributedString = NSMutableAttributedString(string: "С возвращением!\n",
                                                             attributes: [NSAttributedString.Key.font: UIFont(name: "MPLUS1p-Medium", size: 24)])
            attributedString.append(NSAttributedString(string: "Lorby - твой личный репетитор",
                                                       attributes: [NSAttributedString.Key.font: UIFont(name: "MPLUS1p-Regular", size: 20)]))
            label.attributedText = attributedString
            return label
    }()
    
    let exitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выйти", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        // Добавьте действие для кнопки
        
        return button
    }()
    
    // MARK: - Initializers
    
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
        addSubview(welcomeImageView)
        addSubview(welcomeLabel)
        addSubview(exitButton)
    }
    
    private func setupConstraints() {
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(118)
        }
        
        welcomeImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(welcomeLabel.snp.bottom).offset(48)
            make.width.equalTo(296.4)
            make.height.equalTo(314.94)
        }
        
        
        exitButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-24)
        }
    }

}

