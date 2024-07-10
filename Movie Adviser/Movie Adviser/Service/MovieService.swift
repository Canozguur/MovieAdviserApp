//
//  MovieService.swift
//  Movie Adviser
//
//  Created by Can Özgür on 9.07.2024.
//

import Foundation
import Combine

struct Director {
    var name: String
    var movies: [Movie] = []
}

class MovieService: ObservableObject {
    
    private var movies : [Movie] = Movie.allMovie
    
    private var first300Movies: [Movie] {
            return Array(movies.prefix(10))
        }
    
    var moviesByCategory: [String: [Movie]] {
        var categoryDict: [String: [Movie]] = [:]
        
        for movie in first300Movies {
            for category in movie.categories {
                if categoryDict[category] != nil {
                    categoryDict[category]?.append(movie)
                } else {
                    categoryDict[category] = [movie]
                }
            }
        }
        
        return categoryDict
    }
    
    
    var directors: [String: Director] = [:]
    
    var actorMovies: [String: [Movie]] {
        var directors: [String: [Movie]] = [:]
        
        for movie in movies {
            if directors[movie.director] != nil {
                directors[movie.director]?.append(movie)
            } else {
                directors[movie.director] = [movie]
            }
        }
        
        return directors
    }
}
