//
//  MovieListTableViewController.swift
//  Starwars
//
//  Created by PRIYANS on 21/2/20.
//  Copyright © 2020 PRIYANS. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController {
    
    private var networkService: NetworkServices {
        return (UIApplication.shared.delegate as! AppDelegate).networkService
    }
    var movies = [MovieViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        networkService.fetchMovies(completion: handlerForGetMovieRequest(_:))
        
    }
    
    private func handlerForGetMovieRequest(_ result: MovieResult<[Movie]>) {
        switch result {
        case let .success(movies):
            self.movies = movies.map{ movie in MovieViewModel(movie: movie)}
            tableView.reloadData()
        case let .failure(error):
            self.movies = []
          
        }
    }
    
    func errorHandling() {
        
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.reuseIdentifier, for: indexPath) as! MovieTableViewCell
        let movie = movies[indexPath.row]

        cell.bind(movie: movie)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController, segue.identifier == "goToDetail" {
            if let indexPAth = tableView.indexPathForSelectedRow {
                vc.movie = movies[indexPAth.row]
            }
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
