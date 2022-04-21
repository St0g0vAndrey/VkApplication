//
//  NetworkServiceUser.swift
//  VkApplication
//
//  Created by Андрей Стогов on 10.03.2022.
//

import Foundation

class NetworkServiceUser {
    
    let configurate = URLSessionConfiguration.default
    lazy var mySession = URLSession(configuration: configurate)
    
    private var urlConstructor: URLComponents = {
        var constructor = URLComponents()
        constructor.scheme = "https"
        constructor.host = "api.vk.com"
        constructor.path = "/method/friends.get"
        return constructor
    }()
    
    func featchUser(completion: @escaping (Result<[UserModel], Error>) -> Void) {
        
        var constructor = urlConstructor
        constructor.queryItems = [
            URLQueryItem(name: "access_token", value: SomeSessions.instance.token),
            URLQueryItem(name: "user_ids", value: "\(SomeSessions.instance.userID)"),
            URLQueryItem(name: "order", value: "name"),
            URLQueryItem(name: "fields", value: "photo_50"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard
            let url = constructor.url
        else { return }
        
        let task = mySession.dataTask(with: url) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            
            guard error == nil,
                    let data = data
            else { return }
            do {
                let usersResponse = try JSONDecoder().decode(
                    UserResponse.self,
                    from: data)
                    completion(.success(usersResponse.user.items))
            } catch {
                    completion(.failure(error))
            }
        }
        task.resume()
    }
}
