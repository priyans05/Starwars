//
//  NetworkClient.swift
//  Starwars
//
//  Created by PRIYANS on 21/2/20.
//  Copyright © 2020 PRIYANS. All rights reserved.
//

import Foundation
typealias MovieResult<T> = Result<T, APIError>
typealias CharacterResult<T> = Result<T, APIError>

protocol NetworkClient {
    func fetchMovies(completion: @escaping (MovieResult<[Movie]>)-> Void)
    func fetchCharacterDetail(url: String, completion: @escaping (CharacterResult<Character>)-> Void)
}
