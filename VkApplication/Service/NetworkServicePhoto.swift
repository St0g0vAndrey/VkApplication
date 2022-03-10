//
//  NetworkServicePhoto.swift
//  VkApplication
//
//  Created by Андрей Стогов on 10.03.2022.
//

import Foundation

class NetworkServicePhoto {
    
    let configurate = URLSessionConfiguration.default
    lazy var mySession = URLSession(configuration: configurate)
    
    private let urlConstructor: URLComponents = {
       var constructor = URLComponents()
        constructor.scheme = "https"
        constructor.host = "api.vk.com"
        constructor.path = "/method/photos.get"
        return constructor
    }()
    
    func featchUser(completion: @escaping(Result<[UserPhoto], Error>) -> Void) {
        
        var constructor = urlConstructor
        constructor.queryItems = [
            URLQueryItem(name: "access_token", value: "\(SomeSessions.instance.token)"),
            URLQueryItem(name: "user_id", value: "\()"),
            URLQueryItem(name: "album_id", value: "profile"),
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
            let photoResponse = try JSONDecoder().decode(
                UserPhotoResponse.self,
                from: data)
                completion(.success(photoResponse.photoResponse.items))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
