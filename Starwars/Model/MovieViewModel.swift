//
//  MovieViewModel.swift
//  Starwars
//
//  Created by PRIYANS on 21/2/20.
//  Copyright © 2020 PRIYANS. All rights reserved.
//

import Foundation
public struct MovieViewModel {
    private(set) var Movie: Movie
    public let title: String
    public let premiered: String
    public let characters: [String]
    public let detail: String
    public let director: String
    public let producer: String
    
}

extension MovieViewModel {
    public init(movie: Movie) {
        self.Movie = movie
        self.title = movie.title
        let formatter = DateFormatter()
        if let date = formatter.date(from: movie.release_date) {
            self.premiered = formatter.string(from: date)
        } else {self.premiered = ""}
        self.characters = movie.characters
        self.detail = movie.opening_crawl
        self.director = movie.director
        self.producer = movie.producer
    }
}

func createURLFromStringsFor(characters: [String]) -> [URL?] {
    var returningURLS = [URL?]()
    characters.forEach { URL(string: $0) != nil ? returningURLS.append(URL(string: $0)) : nil}
    return returningURLS
}


