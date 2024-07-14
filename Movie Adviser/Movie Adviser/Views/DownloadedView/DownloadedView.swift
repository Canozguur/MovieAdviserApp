//
//  DownloadedView.swift
//  Movie Adviser
//
//  Created by Can Özgür on 14.07.2024.
//

import SwiftUI

struct DownloadedView: View {
    var movies : [Movie]
    var body: some View {
        ScrollView(.vertical){
            LazyVStack(alignment:.leading){   
                ForEach(movies , id: \.self){ movie in
                    HStack(alignment:.top){
                        ZStack(alignment: .topTrailing){
                            AsyncImage(url: URL(string: movie.photoURL)) { phase in
                                if let image = phase.image {
                                    image.resizable()// Displays the loaded image.
                                } else if phase.error != nil {
                                    Color.red // Indicates an error.
                                } else {
                                    Color.blue // Acts as a placeholder.
                                }
                            }
                            .frame(width:240,height:150)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            Circle()
                                .foregroundStyle(.gray)
                                .opacity(0.4)
                                .overlay(
                                    Image(systemName: "xmark")
                                        .frame(width: 30)
                                        .bold()
                                ).frame(width: 30)
                                .padding(.all,5)
                        }
                        VStack(alignment:.leading){
                            Text(movie.title)
                                .foregroundStyle(.white)
                                .bold()
                                .lineLimit(3)
                                .padding(.bottom,7)
                            // filmin suresi
                            // filmin hafizada tuttugu gb sayisi
                            Text("2h 14m - 5.6 gb")
                                .font(.caption2)
                                .foregroundStyle(.gray)
                        }.padding(.leading,7)
                    }
                }.padding(.bottom)
                   
            }.padding()
                
        }.navigationTitle("Downloaded")
            .navigationBarTitleDisplayMode(.large)
            
    }
}
#Preview {
    DownloadedView(movies: Array(Movie.allMovie.prefix(10))).preferredColorScheme(.dark)
}
