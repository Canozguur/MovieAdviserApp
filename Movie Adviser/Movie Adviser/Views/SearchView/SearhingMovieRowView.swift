//
//  SearhingMovieRowView.swift
//  Movie Adviser
//
//  Created by Can Özgür on 10.07.2024.
//

import SwiftUI

struct SearhingMovieRowView: View {
    var movie : Movie

    
    var body: some View {
        HStack(alignment:.top){
            ZStack{
                AsyncImage(url: URL(string: movie.photoURL)) { phase in
                    if let image = phase.image {
                        image.resizable()// Displays the loaded image.
                    } else if phase.error != nil {
                        Color.red // Indicates an error.
                    } else {
                        Color.blue // Acts as a placeholder.
                    }
                }
            }
            .frame(width: 90,height: 110)
            
            VStack(alignment:.leading,spacing: 10){
                Text("\(movie.title)")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.gray)
                    .lineLimit(1)
                HStack{
                    Text("\(movie.releaseYear)")
                        .bold()
                        .foregroundStyle(.gray)
                    ForEach(movie.categories.prefix(2),id: \.self){ category in
                        HStack{
                            Text(category)
                                .bold()
                                .foregroundStyle(.gray)
                        }
                       
                    }
                }
               
                Text("2h 20m")
                    .bold()
                    .foregroundStyle(.gray)
                
            }
            Spacer()
            
            Image(systemName: "chevron.right")
                .bold()
                .foregroundStyle(.white)
            
          
                
        }.padding()
       
    }
}

#Preview {
    SearhingMovieRowView(movie: Movie.sampleMovie).preferredColorScheme(.dark)
}
