//
//  DetailViewController.swift
//  Starwars
//
//  Created by PRIYANS on 21/2/20.
//  Copyright © 2020 PRIYANS. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var directorName: UILabel!
    @IBOutlet weak var producerName: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var movie: MovieViewModel!
    var characters: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.movieName.text = movie.title
        self.directorName.text = movie.director
        self.producerName.text = movie.producer
        // Do any additional setup after loading the view.
        
        movie.characters.forEach {urlString in NetworkServices().fetchCharacterDetail(url: urlString, completion: handlerForGetMovieRequest(_:))}
      
    }
    
    private func handlerForGetMovieRequest(_ result: CharacterResult<Character>) {
        switch result {
        case let .success(character):
            self.characters.append(character.name)
            tableView.reloadData()
        case let .failure(error):
            print(error)
          
        }
    }


}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.reuseIdentifier, for: indexPath) as! DetailTableViewCell
        
        cell.textLabel?.text = characters[indexPath.row]
        
        return cell
    }
    
    
}
