//
//  Movie.swift
//  Movie Checklist
//
//  Created by River McCaine on 1/14/21.
//

import Foundation

class Movie: Codable {
    var title: String?
    var director: String?
    var genre: String?
    var releaseDate: String?
    var watchDate: Date?
    var isWatched: Bool
    
    init(title: String?, director: String?, genre: String?, releaseDate: String?, watchDate: Date?, isWatched: Bool = false) {
        self.title = title
        self.director = director
        self.genre = genre
        self.releaseDate = releaseDate
        self.watchDate = watchDate
        self.isWatched = isWatched
    }
}//End of class

extension Movie: Equatable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        lhs.title == rhs.title && lhs.director == rhs.director && lhs.genre == rhs.genre && lhs.releaseDate == rhs.releaseDate && lhs.watchDate == rhs.watchDate && lhs.isWatched == rhs.isWatched
    }
    
    
}
