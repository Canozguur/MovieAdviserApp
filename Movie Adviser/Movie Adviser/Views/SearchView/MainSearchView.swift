//
//  MainSearchView.swift
//  Movie Adviser
//
//  Created by Can Özgür on 10.07.2024.
//

import SwiftUI

struct MainSearchView: View {
    private var allMovies = Movie.allMovie
    @StateObject private var ms = MovieService()
    @State private var textField : String = ""
    @State var isSearching = false
    var body: some View {
        NavigationStack{
            ScrollView(.vertical) {
                // Top Searching Bar
                ExtractedView(textField: $textField, isSearching: $isSearching)
                
                ForEach(allMovies.prefix(30).filter({"\($0)".contains(textField) || textField.isEmpty}),id:\.self) { movie in
                    
                    NavigationLink(value: movie) {
                        
                        SearhingMovieRowView(movie: movie)
                    }.navigationDestination(for: Movie.self) { movie in
                        MovieDetailView(movie: movie, isLiked: false, isDisliked: false, isDowlondad: false, isSaved: false, isSended: false)
                    }
                   
                    
                }
            }
        }
    }
}

#Preview {
    MainSearchView().preferredColorScheme(.dark)
}

struct ExtractedView: View {
    @Binding var textField : String
    @Binding var isSearching : Bool
    var body: some View {
        HStack{
            HStack{
                TextField("Searching Movie", text: $textField)
                    .padding(.leading,24)
                    .foregroundStyle(.white)
                
                
            }
            .padding()
            .background(Color(.systemGray3))
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .padding(.horizontal)
            .onTapGesture {
                isSearching = true
            }
            .overlay(
                HStack{
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    if isSearching{
                        Button(action: {
                            textField = ""
                            isSearching = false
                        }, label: {
                            Image(systemName: "xmark.circle.fill").padding(.vertical)
                        })
                    }
                    
                    
                }.padding(.horizontal,32)
            )
            .transition(.move(edge: .trailing))
            .animation(Animation.spring(),value: isSearching)
            
            if isSearching {
                Button(action: {
                    textField = ""
                    isSearching = false
                }, label: {
                    Text("Cancel")
                        .padding(.trailing)
                        .padding(.leading)
                })
                .transition(.move(edge: .trailing))
                .animation(Animation.spring(),value: isSearching)
            }
        }
    }
}
