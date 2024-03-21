//
//  NetworkLayer.swift
//  Neobis_iOS_Auth
//
//  Created by Игорь Пачкин on 12/3/24.
//

import Foundation
import UIKit

protocol NetworkLayerDelegate: AnyObject {
    func didCompleteLogin(success: Bool)
}


// Определение ошибок, которые могут возникнуть при сетевом запросе
enum NetworkError: Error {
    case invalidURL
    case encodingError
    case dataNotFound
    case badResponse
    case serverError(String)
}

class NetworkLayer {
    
    weak var delegate: NetworkLayerDelegate?
    
    let baseURL = "https://troubled-eyes-production.up.railway.app/api/v1/auth"
    
    static let shared = NetworkLayer()
    
    init () {}
    

    func register(userCredentials: RegistrationModel, completion: @escaping (Result<AuthenticationResponse, Error>) -> Void) {
        print("Начали регистрацию")
        guard let url = URL(string: "\(baseURL)/register") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        print("Ссылка есть")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        print("Ссылка ес")
        
        do {
            let jsonData = try JSONEncoder().encode(userCredentials)
            request.httpBody = jsonData
        } catch {
            completion(.failure(NetworkError.encodingError))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(.failure(NetworkError.dataNotFound))
                print("не пришла дата с бэка")
                return
            }
            print("пришла дата с бэка")
            guard error == nil else {
                completion(.failure(NetworkError.serverError(error?.localizedDescription ?? "Server Error")))
                return
            }
            print("ошибок нет")
            print(response)
            print(data)
            do {
                let authResponse = try JSONDecoder().decode(AuthenticationResponse.self, from: data)
                completion(.success(authResponse))
            } catch {
                completion(.failure(NetworkError.badResponse))
            }
        }.resume()
    }
    /*
    func login(loginCredentials: LoginModel, completion: @escaping (Result<AuthenticationResponse, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/login") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(loginCredentials)
            request.httpBody = jsonData
        } catch {
            completion(.failure(NetworkError.encodingError))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(.failure(NetworkError.dataNotFound))
                print("не пришла дата с бэка")
                return
            }
            
            guard error == nil else {
                completion(.failure(NetworkError.serverError(error?.localizedDescription ?? "Server Error")))
                return
            }
            print("ошибок нет")
            print("response:", response)
            print("data:", data)
            do {
                let authResponse = try JSONDecoder().decode(AuthenticationResponse.self, from: data)
                completion(.success(authResponse))
            } catch {
                completion(.failure(NetworkError.badResponse))
            }
        }.resume()
    }*/
    
    func login(loginCredentials: LoginModel, completion: @escaping (Result<AuthenticationResponse, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/login") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        
        
        do {
            let jsonData = try JSONEncoder().encode(loginCredentials)
            request.httpBody = jsonData
        } catch {
            completion(.failure(NetworkError.encodingError))
            return
        }

        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.badResponse))
                return
            }

            print(response)
            print(data)

            if httpResponse.statusCode == 200 {
                // Обработка успешного ответа
                print("200 ушло")
                completion(.success(AuthenticationResponse(token: "dummyToken"))) // Замените на вашу логику обработки
                DispatchQueue.main.async {
                    self?.delegate?.didCompleteLogin(success: true)
                }
            } else {
                // Обработка неуспешного ответа
                completion(.failure(NetworkError.serverError("Invalid response")))
                DispatchQueue.main.async {
                    self?.delegate?.didCompleteLogin(success: false)
                }
            }
        }.resume()

    }



    
}



