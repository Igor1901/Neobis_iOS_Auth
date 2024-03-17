//
//  123.swift
//  Neobis_iOS_Auth
//
//  Created by Игорь Пачкин on 17/3/24.
//

import UIKit
import SnapKit

class _23: UIView {


    // MARK: - Properties

    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorby"
        label.textAlignment = .center
        label.font = UIFont(name: "MPLUS1p-Black", size: 40)
        return label
    }()
    
    let welcomeLabel2: UILabel = {
        let label = UILabel()
        label.text = "Твой личный репетитор"
        label.textAlignment = .center
        label.font = UIFont(name: "MPLUS1p-Medium", size: 24)
        return label
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "illustration")
        imageView.contentMode = .scaleAspectFit
        return imageView
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
        addSubview(welcomeLabel2)
    }

    private func setupConstraints() {
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).offset(24)
            
        }
        
        welcomeLabel2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(welcomeLabel.snp.bottom).offset(8)
        }
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).offset(24)
            make.width.equalTo(187)
            make.height.equalTo(194)
        }
        
    }






}
