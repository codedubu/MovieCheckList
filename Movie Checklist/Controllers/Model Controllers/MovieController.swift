//
//  MovieController.swift
//  Movie Checklist
//
//  Created by River McCaine on 1/14/21.
//

import Foundation

class MovieController {
    // MARK: - Shared Instance
    static let shared = MovieController()
    
    // MARK: - Source of Truth
    var movies: [Movie] = []
    
    // MARK: - CRUD
    func createMovieWith(title: String?, director: String?, genre: String?, releaseDate: String?, watchDate: Date?) {
        let newMovie = Movie(title: title, director: director, genre: genre, releaseDate: releaseDate, watchDate: watchDate)
        movies.append(newMovie)
        saveToPersistenceStore()
    }
    
    func update(movie: Movie, title: String?, director: String?, genre: String?, releaseDate: String?, watchDate: Date?) {
        movie.title = title
        movie.director = director
        movie.genre = genre
        movie.releaseDate = releaseDate
        movie.watchDate = watchDate
        saveToPersistenceStore()
    }
    
    func toggleIsWatched(movie: Movie) {
        movie.isWatched = !movie.isWatched
        saveToPersistenceStore()
    }
    
    func delete(movie: Movie) {
        guard let movieIndex = movies.firstIndex(of: movie) else { return }
        movies.remove(at: movieIndex)
        saveToPersistenceStore()
    }
    
    // MARK: - Persistence
    
    // fileURL
    func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("MovieChecklist.json")
        return fileURL
    }
    
    // save
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(movies)
            try data.write(to: fileURL())
        } catch {
            print(error)
            print(error.localizedDescription)
        }
    }
    
    // load
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: fileURL())
            let foundMovie = try JSONDecoder().decode([Movie].self, from: data)
            movies = foundMovie
        } catch {
            print(error)
            print(error.localizedDescription)
        }
    }
    
    
    
}
