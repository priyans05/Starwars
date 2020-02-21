//
//  Movie.swift
//  Starwars
//
//  Created by PRIYANS on 21/2/20.
//  Copyright © 2020 PRIYANS. All rights reserved.
//

import Foundation

public struct MovieList: Codable {
    let count: Int
    let results: [Movie]
}

public struct Movie: Codable {
    let title: String
    let opening_crawl: String
    let director: String
    let producer: String
    let release_date: String
    let characters: [String]
}

public struct Character: Codable {
    var name: String
}
