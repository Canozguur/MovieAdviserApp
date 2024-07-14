//
//  FavoruiteMovieItem.swift
//  Movie Adviser
//
//  Created by Can Özgür on 14.07.2024.
//

import SwiftUI

struct FavoruiteMovieItem: View {
    var user : User
    // @EnvironmentObject var userManager : UserService
    var movie : Movie
    
    @State var isDowloaded : Bool
    var body: some View {
        ZStack(alignment:.top){
            AsyncImage(url: URL(string: movie.photoURL)) { phase in
                if let image = phase.image {
                    image.resizable()// Displays the loaded image.
                } else if phase.error != nil {
                    Color.red // Indicates an error.
                } else {
                    Color.blue // Acts as a placeholder.
                }
            }
            .frame(width: 170,height: 280)
                
            HStack{
                Button(action: {
                    
                    isDowloaded.toggle()
                    // userManager.addDowloadedMovie(movie)
                }, label: {
                    Circle()
                        .frame(width: 30)
                        .foregroundStyle(isDowloaded ?.purple : .white)
                        .opacity(isDowloaded ? 1 : 0.4)
                        .overlay(content:{
                            Image(systemName: "arrow.down")
                                .foregroundStyle(.white)
                                
                        })
                })
               
                    
                    
                
                Spacer()
               
                    Circle()
                        .frame(width: 30)
                        .foregroundStyle(.white)
                        .opacity(0.4)
                        .overlay(content:{
                            Image(systemName: "xmark")
                                .foregroundStyle(.white)
                        })
                   
                
            }.frame(width: 145)
                .padding()
            
        }
    }
}

#Preview {
    FavoruiteMovieItem(user: User.sampleUser, movie: Movie.sampleMovie, isDowloaded: true)
}
