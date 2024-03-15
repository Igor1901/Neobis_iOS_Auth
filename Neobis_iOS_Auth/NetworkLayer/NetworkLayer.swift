//
//  NetworkLayer.swift
//  Neobis_iOS_Auth
//
//  Created by Игорь Пачкин on 12/3/24.
//

import Foundation

// Определение ошибок, которые могут возникнуть при сетевом запросе
enum NetworkError: Error {
    case invalidURL
    case encodingError
    case dataNotFound
    case badResponse
    case serverError(String)
}

class NetworkLayer {
    
    private let baseURL = "https://troubled-eyes-production.up.railway.app/api/v1/auth"
    
    static let shared = NetworkLayer()
    
    private init () {}
    

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
}



