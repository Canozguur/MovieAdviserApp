//
//  Movie_AdviserApp.swift
//  Movie Adviser
//
//  Created by Can Özgür on 7.07.2024.
//

import SwiftUI

@main
struct Movie_AdviserApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Main", systemImage: "house")
                    }
                    
                MainSearchView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                FavoruiteView()
                    
                    .tabItem {
                        Label("FavList", systemImage: "heart.fill")
                    }
                MainProfileView()
                    .tabItem {
                        Label("Account", systemImage: "person.crop.circle.fill")
                    }
                
            }
        }
    }
}
