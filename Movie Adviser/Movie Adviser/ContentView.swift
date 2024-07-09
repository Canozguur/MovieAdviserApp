//
//  ContentView.swift
//  Movie Adviser
//
//  Created by Can Özgür on 7.07.2024.
//

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
            .background(Color.black)
            
        }
        
    }

}


#Preview {
    ContentView()
}
