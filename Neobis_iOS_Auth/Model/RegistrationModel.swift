//
//  RegistrationModel.swift
//  Neobis_iOS_Auth
//
//  Created by Игорь Пачкин on 12/3/24.
//

import Foundation

struct RegistrationModel: Encodable {
    let username: String
    let email: String?
    let password: String
    let passwordConfirm: String
}
