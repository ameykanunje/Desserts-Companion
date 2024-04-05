//
//  APIManager.swift
//  Desserts Companion
//
//  Created by csuftitan on 4/3/24.
//

import UIKit

enum DataError : Error{
    case invalidURL
    case invalidData
    case invalidResponse
    case network(Error?)
}
//typealias Handler = (Result<Dessert, DataError>) -> Void

typealias Handler<T> = (Result<T, DataError>) -> Void

final class APIManager{
    static var shared = APIManager()
    
    private init(){}
    
    func request<T: Decodable>(
        modelType : T.Type,
        type : EndPointType,
        completion : @escaping Handler<T>
    ){
        guard let url = type.url else{
            completion(.failure(.invalidData))
            return
        }
    
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            guard let data, error == nil else{
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else{
                completion(.failure(.invalidResponse))
                return
            }
            
            do{
                let decodedData = try JSONDecoder().decode(modelType, from: data)
                //print(decodedData)
                completion(.success(decodedData))
            }catch{
                completion(.failure(.network(error)))
            }
            
        }.resume()
    }
    
}
