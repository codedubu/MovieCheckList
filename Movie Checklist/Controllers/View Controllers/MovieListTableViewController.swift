//
//  MovieListTableViewController.swift
//  Movie Checklist
//
//  Created by River McCaine on 1/14/21.
//

import UIKit

class MovieListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        MovieController.shared.loadFromPersistenceStore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return MovieController.shared.movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        let movie = MovieController.shared.movies[indexPath.row]
        
        cell.delegate = self
        cell.movie = movie
        


        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toMovieDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destination = segue.destination as? MovieDetailViewController else { return }
            let movieToSend = MovieController.shared.movies[indexPath.row]
            destination.movie = movieToSend
        }
        
    }
    

}//End of class

extension MovieListTableViewController: MovieWatchedDelegate {
    func movieCellButtonTapped(_ sender: MovieTableViewCell) {
        guard let movie = sender.movie else { return }
        
        MovieController.shared.toggleIsWatched(movie: movie)
        sender.updateViews()
    }
}
