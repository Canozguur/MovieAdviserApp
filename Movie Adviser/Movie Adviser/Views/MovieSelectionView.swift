//
//  MovieSelectionView.swift
//  Movie Adviser
//
//  Created by Can Özgür on 7.07.2024.
//

import SwiftUI

struct MovieSelectionView: View {
    var movie : Movie
    @State private var isNavigationActive = false
    var body: some View {
        
        ZStack(alignment:.topLeading){
            AsyncImage(url: URL(string: movie.photoURL)) { phase in
                if let image = phase.image {
                    image.resizable()// Displays the loaded image.
                } else if phase.error != nil {
                    Color.red // Indicates an error.
                } else {
                    Color.blue // Acts as a placeholder.
                }
            }
            
            .scaledToFill()
            .frame(width: 140,height: 220)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            HStack{
                Image("imdb")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35,height: 15)
                    .foregroundColor(.red)
                
                //Text("\(String(format: "%.1f", imdb))")
                Text("\(movie.releaseYear)")
                    .foregroundStyle(.white)
                    .font(.subheadline)
            }.padding()
        }
        
    }
}


struct MovieSelectionView_Previews: PreviewProvider {
    static var previews: some View {

        MovieSelectionView(movie: Movie.sampleMovie)
    }
}

