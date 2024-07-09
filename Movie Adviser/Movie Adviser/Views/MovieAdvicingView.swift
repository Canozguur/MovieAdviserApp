//
//  MovieAdvicingView.swift
//  Movie Adviser
//
//  Created by Can Özgür on 7.07.2024.
//

import SwiftUI

struct MovieAdvicingView: View {
    @StateObject private var movieService = MovieService()
    var category : String
    
    var body: some View {
        VStack{
            HStack{
                Text("\(category)")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .bold()
                Spacer()
                Text("See All")
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
                
            }.padding()
                .background(Color.black)
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(movieService.moviesByCategory[category] ?? [],id: \.self) { movie in
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
    MovieAdvicingView(category: "Action")
}
