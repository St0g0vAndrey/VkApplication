//
//  NetworkServiceGroup.swift
//  VkApplication
//
//  Created by Андрей Стогов on 18.02.2022.
//

import Foundation

class NetworkServiceGroup {
    
    let configurate = URLSessionConfiguration.default
    lazy var mySession = URLSession(configuration: configurate)
    
    private var urlConstructor: URLComponents = {
        var constructor = URLComponents()
        constructor.scheme = "https"
        constructor.host = "api.vk.com"
        constructor.path = "/method/groups.get"
        return constructor
    }()
    
    func featchUser(completion: @escaping (Result<[GroupModel], Error>) -> Void) {
        
        var constructor = urlConstructor
        constructor.queryItems = [
            URLQueryItem(name: "access_token", value: SomeSessions.instance.token),
            URLQueryItem(name: "user_ids", value: "\(SomeSessions.instance.userID)"),
            URLQueryItem(name: "extended", value: "1"),
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
            let groupsResponse = try JSONDecoder().decode(
                GroupModelResponse.self,
                from: data)
                completion(.success(groupsResponse.groups.items))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
