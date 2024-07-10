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
            Rectangle()
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
