//
//  MovieDetailView.swift
//  Movie Adviser
//
//  Created by Can Özgür on 7.07.2024.
//

import SwiftUI

struct MovieDetailView: View {
    // @EnvironmentObject var userManager : UserService
    var movie : Movie
    @StateObject private var movieService = MovieService()
    @State var isLiked : Bool
    @State var isDisliked : Bool
    @State var isDowlondad : Bool
    @State var isSaved : Bool
    @State var isSended : Bool

    var body: some View {
        ScrollView{
            VStack(alignment:.leading){
                ZStack(alignment: .bottomLeading){
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
                    .frame(maxWidth: .infinity)
                    .frame(height: 460)

                    VStack(alignment:.leading){
                        ZStack{
                            Capsule()
                                .foregroundStyle(.black)
                                .frame(width: 200,height: 30)
                                .opacity(0.3)
                            HStack{
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Text("7.6  |  \(movie.releaseYear)  |  12+")
                                    .foregroundStyle(.white)
                                
                            }
                        }
                        
                    }
                    
                }
                
                // Watch Now button
                ZStack{
                    Capsule()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color(red: 48/255, green: 25/255, blue: 52/255), .white]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: 350, height: 45)
                        .padding()
                    HStack{
                        HStack{
                            Image(systemName: "play.fill")
                                .foregroundStyle(.white)
                                .font(.title)
                            Button(action: {
                                
                            }, label: {
                                Text("Watch Now")
                                    .foregroundStyle(.white)
                            })
                           
                        }.padding(.horizontal)
                        HStack{
                            Image(systemName: "film")
                            Button(action: {
                                
                            }, label: {
                                Text("Watch Trailer")
                                    .foregroundStyle(Color(red: 48/255, green: 25/255, blue: 52/255))
                                    .font(.headline)
                            })
                           
                        }.padding(.horizontal)
                        
                    }
                }
                VStack(alignment: .leading){
                    HStack{
                        ForEach(movie.categories.prefix(3), id: \.self) {category  in
                            Text("\(category)")
                                .foregroundStyle(.white)
                                .fontWeight(.thin)
                        }
                        
                        
                        Spacer()
                        Text("* 2h 15m")
                            .foregroundStyle(.white)
                    }.padding(.horizontal)
                    
                    Text("\(movie.title)").foregroundStyle(.white)
                        .font(.title2)
                        .padding(.horizontal)
                    Text("\(movie.description)").foregroundStyle(.white)
                        .lineLimit(5)
                        .padding(.horizontal)
                        .padding(.vertical,5)
                }
                
                // like Button and dislike
                HStack{
                    ZStack{
                        Capsule()
                            .frame(width:170,height: 40)
                            .foregroundStyle(.gray)
                            .opacity(0.3)
                        HStack{
                            Button(action: {
                                isLiked.toggle()
                                isDisliked = false
                            }, label: {
                                Image(systemName: isLiked ? "hand.thumbsup.fill": "hand.thumbsup")
                                    .foregroundStyle(.white)
                                Text("Num")
                                    .foregroundStyle(.white)
                            })
                            
                            Rectangle()
                                .frame(width: 2)
                                .foregroundStyle(.gray)
                                .font(.title)
                                .padding(.vertical,6)
                            
                            Button(action: {
                                isDisliked.toggle()
                                isLiked = false
                            }, label: {
                                Image(systemName: isDisliked ? "hand.thumbsdown.fill" : "hand.thumbsdown")
                                    .foregroundStyle(.white)
                                Text("Num")
                                    .foregroundStyle(.white)
                            })
                        }
                    }
                    Spacer()
                    HStack{
                        Button(action: {
                            // indirilen film
                            isDowlondad.toggle()
                        }, label: {
                            ZStack{
                                Circle()
                                    .frame(height: 40)
                                    .foregroundStyle(isDowlondad ? .purple : .gray)
                                Image(systemName: "arrow.down")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15,height: 20)
                                    .foregroundStyle(.white)
                                    .bold()
                                
                            }
                        })
                        Button(action: {
                            isSaved.toggle()
                            if isSaved {
                            // KAYDET burasi filmin favori olan kismi
                            } else {
                             // kaydetme
                            }
                        
                        }, label: {
                            ZStack{
                                Circle()
                                    .frame(height: 40)
                                    .foregroundStyle(isSaved ? .purple : .gray)
                                Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15,height: 20)
                                    .foregroundStyle(.white)
                                    .bold()
                                
                            }
                        })
                        Button(action: {
                            isSended.toggle()
                        }, label: {
                            ZStack{
                                Circle()
                                    .frame(height: 40)
                                    .foregroundStyle(isSended ? .purple : .gray)
                                    
                                Image(systemName: isSended ? "paperplane.fill": "paperplane")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15,height: 20)
                                    .foregroundStyle(.white)
                                    
                                    .bold()
                                
                            }
                        })
                    }
                }.padding(.horizontal)
                
                //Cast & Crew Actors
                Text("Cast & Crew")
                    .foregroundStyle(.white)
                    .font(.title2)
                    .bold()
                    .padding()
                
                ScrollView(.horizontal){
                    HStack{
                        
                        MovieActorsView(name: String(movie.director.split(separator: " ")[0]), surname: String(movie.director.split(separator: " ")[1]), job: "Director")
                            
                        
                        MovieActorsView(name: "Sam", surname: "Worthington", job: "Actor")
                        
                        MovieActorsView(name: "Michelle", surname: "Rodrigez", job: "Actor")
                        
                        MovieActorsView(name: "Michelle", surname: "Rodrigez", job: "Actor")
                        
                    }
                }
                
            }
           

        }            
        .ignoresSafeArea()
        .background(Color.black)
    }
}

#Preview {
    MovieDetailView(movie:Movie.sampleMovie , isLiked: false, isDisliked: false, isDowlondad: false, isSaved: false, isSended: false)
        //.environmentObject(UserService(user: User.sampleUser))
}

