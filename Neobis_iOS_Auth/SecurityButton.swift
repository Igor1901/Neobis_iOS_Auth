//
//  SecurityButton.swift
//  Neobis_iOS_Auth
//
//  Created by Игорь Пачкин on 10/3/24.
//

import UIKit


class SecurityButton: UIButton {
    var firstImage: UIImage?
    var secondImage: UIImage?

    var isToggledOn = false {
        didSet {
            if isToggledOn {
                self.setImage(secondImage, for: .normal)
            } else {
                self.setImage(firstImage, for: .normal)
            }
        }
    }

    func toggle() {
        isToggledOn.toggle()
    }
    
    func setupButton() {
        // Преднастройка кнопки
        firstImage = UIImage(named: "closeEye")
        secondImage = UIImage(named: "openEye")
        setImage(firstImage, for: .normal)
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc func buttonTapped(_ sender: SecurityButton) {
        toggle()
        // Добавьте здесь логику для переключения отображения/скрытия пароля
    }
}
