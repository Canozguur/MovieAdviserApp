//
//  MovieService.swift
//  Movie Adviser
//
//  Created by Can Özgür on 9.07.2024.
//

import Foundation
import Combine

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
}
