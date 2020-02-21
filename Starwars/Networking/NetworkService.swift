//
//  NetworkService.swift
//  Starwars
//
//  Created by PRIYANS on 21/2/20.
//  Copyright © 2020 PRIYANS. All rights reserved.
//

import Foundation
class NetworkServices: NetworkClient {
    
    
    
    
    
    private enum EndPoints {
    case base
    
    var url: URL? {
        switch self {
        case .base:
            var components = URLComponents()
            components.host = "swapi.co"
            components.scheme = "https"
            components.path = "/api/films"
            return components.url
        }
        }
    }
    
    //MARK:- Generic Get Request and handling response inside.
       private func taskForGetRequest<ResponseType>(url: URL, responseType: ResponseType.Type, completion: @escaping (Result<ResponseType, APIError>) -> Void) where ResponseType : Decodable {
           URLSession.shared.dataTask(with: url, completionHandler: {  (data: Data?, response: URLResponse?, error: Error?) in
               if let error = error {
                   DispatchQueue.main.async {
                       completion(Result.failure(APIError.httpError(error: error)))
                   }
                   return
               }
               let decoder = JSONDecoder()
               guard let data = data else {
                   DispatchQueue.main.async {
                       completion(Result.failure(APIError.dataError))
                    
                   }
                   return
               }
               do {
                print(String(data: data, encoding: .utf8))
                   let responseObject = try decoder.decode(ResponseType.self, from: data)
                
                   DispatchQueue.main.async {
                       completion(Result.success(responseObject))
                   }
                   
               } catch {
                   DispatchQueue.main.async {
                       completion(Result.failure(APIError.invalidJSON))
                   }
               }
           }).resume()
           
       }
    
    
    public func fetchMovies(completion: @escaping (MovieResult<[Movie]>) -> Void) {
        guard let url = EndPoints.base.url else {completion(Result.failure(APIError.urlError))
            return}
        
       taskForGetRequest(url: url, responseType: MovieList.self) { (response) in
            switch response {
            case let .success(movieList):
                completion(Result.success(movieList.results))
            case let .failure(error):
                print(error)
                completion(Result.failure(error))
            }
        }
        
        
    }
    
    func fetchCharacterDetail(url: String, completion: @escaping (CharacterResult<Character>) -> Void) {
        guard let url = URL(string: url) else {completion(Result.failure(APIError.urlError))
            return}
        taskForGetRequest(url: url, responseType: Character.self) { (response) in
            switch response {
            case let .success(char):
                completion(Result.success(char))
            case let .failure(error):
                print(error)
                completion(Result.failure(error))
            }
        }
        
    }
     
}
