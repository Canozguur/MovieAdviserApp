//
//  ContentView.swift
//  Movie Adviser
//
//  Created by Can Özgür on 7.07.2024.
//
// Dark Purple Color(red: 48/255, green: 25/255, blue: 52/255)

import SwiftUI

struct ContentView: View {
    @StateObject private var movieService = MovieService()
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical){
                VStack {
                    TopHeader(name: "Avatar", imdb: 8.7,isSaved: false)
                    
                    ForEach(movieService.moviesByCategory.keys.sorted(), id: \.self) { category in
                        VStack(alignment: .leading) {
                            
                            MovieAdvicingView(category: category)
                        }
                    }
                    
                }
                
                
            }
            .ignoresSafeArea()
            .preferredColorScheme(.dark)
            .navigationBarTitleDisplayMode(.inline)
            
        }.tint(.white)
        
        
    }

}


#Preview {
    ContentView()
}
