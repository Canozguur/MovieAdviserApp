//
//  ActorMoviesListView.swift
//  Movie Adviser
//
//  Created by Can Özgür on 10.07.2024.
//

import SwiftUI

struct ActorMoviesListView: View {

    @StateObject private var movieService = MovieService()
    var actorName : String
    
    var body: some View {
        VStack{
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(movieService.actorMovies[actorName] ?? [],id: \.self) { movie in
                        NavigationLink(value:movie) {
                            MovieSelectionView(movie: movie)
                                .padding(.horizontal, 8)
                        }.navigationDestination(for: Movie.self){ movie in  MovieDetailView(movie: movie, isLiked: false, isDisliked: false, isDowlondad: false, isSaved: false, isSended: false)
                        }
                            
                      
                    }
                
                }
            }
        }
    }
}

#Preview {
    ActorMoviesListView(actorName:"James Cameron")
}
