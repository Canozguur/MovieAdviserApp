//
//  UserService.swift
//  Movie Adviser
//
//  Created by Can Özgür on 14.07.2024.
//

import Foundation

class UserService: ObservableObject {
    @Published private var user: User1
    
    init(user: User1) {
        self.user = user
       
    }
    
    func addFavMovie(movie: Movie) {
        user.movieSavedList.append(movie)
        print(user.movieSavedList)
        print("added")
    }
    func deleteFavMovie(_ movie: Movie) {
        user.movieSavedList.removeAll { $0.id == movie.id }
    }
    
    func getFavMovieList() -> [Movie] {
        return user.movieSavedList
    }
    
    func addDowloadedMovie(_ movie: Movie) {
        user.movieDowlondadList.append(movie)
    }
    
    func getDowloadedMovieList() -> [Movie] {
        return user.movieDowlondadList
    }
}
