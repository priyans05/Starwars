//
//  MovieTableViewCell.swift
//  Starwars
//
//  Created by PRIYANS on 21/2/20.
//  Copyright © 2020 PRIYANS. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    static let reuseIdentifier = String(describing: MovieTableViewCell.self)
    
    func bind(movie: MovieViewModel) {
        self.textLabel?.text = movie.title
        self.detailTextLabel?.text = movie.detail
    }
    
    

}
