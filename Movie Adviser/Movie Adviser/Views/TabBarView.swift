//
//  TabBarView.swift
//  Movie Adviser
//
//  Created by Can Özgür on 15.07.2024.
//

import SwiftUI

struct TabBarView: View {
    
    @Binding var showSignInView: Bool
    var body: some View {
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
            MainProfileView(showSignInView: $showSignInView)
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
        }
    }
}


#Preview {
    TabBarView(showSignInView: .constant(false))
}
