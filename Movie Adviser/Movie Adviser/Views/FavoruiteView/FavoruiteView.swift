//
//  FavoruiteView.swift
//  Movie Adviser
//
//  Created by Can Özgür on 14.07.2024.
//

import SwiftUI

struct FavoruiteView: View {
    // @StateObject private var userService = UserService(user: User.sampleUser)
    private var user : User1 = User1.sampleUser
    private var allMovies : [Movie] = Movie.allMovie
    private var first10Movies : [Movie] {
        return Array(allMovies.prefix(10))
    }
    @StateObject private var ms = MovieService()
    
    let columns = Array(repeating: GridItem(.flexible()), count: 2)
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment:.leading){
                    HStack(spacing: 25){
                        ZStack{
                            Button(action: {
                                
                            }, label: {
                                RoundedRectangle(cornerRadius: 25.0)
                                    .frame(width: 175,height: 50)
                            })
                            HStack{
                                Image("random")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 30)
                                
                                Text("Randomizer")
                                    .foregroundStyle(.white)
                                    .bold()
                                    .font(.headline)
                                
                                Spacer()
                            }
                        }
                        NavigationLink(destination: {
                            DownloadedView(movies: User1.sampleUser.movieDowlondadList)
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 25.0)
                                    .frame(width: 175,height: 50)
                                HStack{
                                    Image(systemName: "arrow.down")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 20)
                                        .foregroundStyle(.white)
                                    
                                    Text("Dowloaded")
                                        .foregroundStyle(.white)
                                        .bold()
                                        .font(.headline)
                                        .padding(7)
                                    
                                }
                            }
                        })
                    }.padding(.leading)
                        .padding(.trailing)
                  
                    LazyVGrid(columns: columns){
                        ForEach(first10Movies, id: \.self){ movie in
                            
                            FavoruiteMovieItem(user: User1.sampleUser ,movie: movie, isDowloaded: false)
                        }
                        
                    }.padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    FavoruiteView().preferredColorScheme(.dark)
}
