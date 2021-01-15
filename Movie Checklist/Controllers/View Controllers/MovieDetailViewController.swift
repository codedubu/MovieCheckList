//
//  MovieDetailViewController.swift
//  Movie Checklist
//
//  Created by River McCaine on 1/14/21.
//

import UIKit

class MovieDetailViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var movieNameTextField: UITextField!
    @IBOutlet weak var movieDirectorNameTextField: UITextField!
    @IBOutlet weak var movieGenreNameTextField: UITextField!
    @IBOutlet weak var movieReleaseDateTextField: UITextField!
    @IBOutlet weak var movieWatchedDatePicker: UIDatePicker!
    
    // MARK: - Properties
    //Landing Pad
    var movie: Movie?
    var date: Date?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let movieName = movieNameTextField.text, !movieName.isEmpty,
              let else { return }
        
        if let movie = movie {
            MovieController.shared.update(movie: movie, title: movieName, director: movieDirectorNameTextField, genre: movieGenreNameTextField, releaseDate: movieReleaseDateTextField, watchDate: date)
        }
        
    }
    
    // MARK: - Helper Functions
    func updateViews() {
        guard let sentMovie = movie else { return }
        movieNameTextField.text = sentMovie.title
        movieDirectorNameTextField.text = sentMovie.director
        movieGenreNameTextField.text = sentMovie.genre
        movieReleaseDateTextField.text = sentMovie.releaseDate
        movieWatchedDatePicker.date = sentMovie.watchDate ?? Date()
        
        
    }
    
    
}
