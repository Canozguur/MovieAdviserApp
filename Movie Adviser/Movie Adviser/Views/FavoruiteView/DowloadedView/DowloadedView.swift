//
//  DowloadedView.swift
//  Movie Adviser
//
//  Created by Can Özgür on 14.07.2024.
//

import SwiftUI

struct DownloadedView: View {
    var movie : Movie
    var body: some View {
        LazyVStack{
            Text("Downloaded")
            
            ForEach(0..<10 , id: \.self){index in
                HStack{
                    ZStack(alignment: .topTrailing){
                        Rectangle()
                            .frame(width:140,height:78)
                        Circle()
                            .foregroundStyle(.gray)
                            .opacity(0.4)
                            .overlay(
                            Image(systemName: "xmark")
                                .frame(width: 30)
                            )
                    }
                    VStack{
                        Text(movie.title)
                            .foregroundStyle(.white)
                            .lineLimit(3)
                        // filmin suresi
                        // filmin hafizada tuttugu gb sayisi
                        Text("2h 14m - 5.6 gb")
                            .font(.caption2)
                            .foregroundStyle(.gray)
                    }
                }
            }
        }
    }
}

#Preview {
    DownloadedView(movie: Movie.sampleMovie)
}
