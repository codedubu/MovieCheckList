//
//  MovieTableViewCell.swift
//  Movie Checklist
//
//  Created by River McCaine on 1/14/21.
//

import UIKit

protocol MovieWatchedDelegate: AnyObject {
    func movieCellButtonTapped(_ sender: MovieTableViewCell)
}

class MovieTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieGenreNameLabel: UILabel!
    @IBOutlet weak var watchedButton: UIButton!
    
    // MARK: - Properties
    var movie: Movie? {
        didSet {
            
        }
    }
    
    weak var delegate: MovieWatchedDelegate?
    
    // MARK: - Actions
    @IBAction func watchButtonTapped(_ sender: Any) {
        if let delegate = delegate {
            delegate.movieCellButtonTapped(self)
        }
    }
    
    
    // MARK: - Helper Functions
    func updateViews() {
        guard let movie = movie else { return }
        
        movieTitleLabel.text = movie.title
        movieGenreNameLabel.text = movie.genre
        
        if movie.isWatched {
            watchedButton.setBackgroundImage(UIImage(named:"video.badge.checkmark"), for: .normal)
        } else {
            watchedButton.setBackgroundImage(UIImage(named: "video.fill.badge.checkmark"), for: .normal)
        }
    }
    
}
