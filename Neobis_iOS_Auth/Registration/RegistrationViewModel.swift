//
//  RegistrationViewModel.swift
//  Neobis_iOS_Auth
//
//  Created by Игорь Пачкин on 14/3/24.
//

// RegistrationViewModel.swift

import Foundation

// Протокол для ViewModel, который содержит функции для валидации пароля
protocol RegistrationViewModelProtocol {
    func check(password: String) -> (passwordCheckLenthLabel: ValidState, passwordCheckRegistrLabel: ValidState, passwordCheckContainIntLabel: ValidState, passwordCheckContainSpecSymbolLabel: ValidState)
    func nextButtonTapped(user: RegistrationModel, completion: @escaping (Bool) -> Void)
}

// ViewModel для экрана регистрации
class RegistrationViewModel: RegistrationViewModelProtocol {
    
    private func checkRegex(text: String, pattern: String) -> ValidState {
        do {
            // Создаем экземпляр NSRegularExpression с использованием шаблона
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            
            // Находим совпадения в строке
            let matches = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))
            
            // Печатаем найденные совпадения
            for match in matches {
                let matchedString = (text as NSString).substring(with: match.range)
                return .ok
            }
        } catch {
            return .bad
        }
        return .neutral
    }

    func check(password: String) -> (passwordCheckLenthLabel: ValidState, passwordCheckRegistrLabel: ValidState, passwordCheckContainIntLabel: ValidState, passwordCheckContainSpecSymbolLabel: ValidState) {
        let CheckLenthPattern = "^.{8,15}$"
        let CheckRegistrPattern = "(?=.*[a-z])(?=.*[A-Z]).{1,}"
        let CheckContainIntPattern = "(?=.*\\d).{1,}"
        let CheckContainSpecSymbolPattern = "(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?]).{1,}"
        
        return (
            checkRegex(text: password, pattern: CheckLenthPattern),
            checkRegex(text: password, pattern: CheckRegistrPattern),
            checkRegex(text: password, pattern: CheckContainIntPattern),
            checkRegex(text: password, pattern: CheckContainSpecSymbolPattern)
        )
    }
    
    func nextButtonTapped(user: RegistrationModel, completion: @escaping (Bool) -> Void) {
        NetworkLayer.shared.register(userCredentials: user ) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let authResponse):
                    completion(true)
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(false)
                }
            }
        }
    }
    
}
