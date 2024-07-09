//
//  MoviesCategoryView.swift
//  Movie Adviser
//
//  Created by Can Özgür on 8.07.2024.
//

import SwiftUI

struct MoviesCategoryView: View {
    @State var categoryName : String
    @State var sizeOfWidth : CGFloat
    var body: some View {
        ZStack{
            Capsule()
                .stroke(lineWidth: 1.4)
                .foregroundStyle(Color(.blue))
                .frame(width: sizeOfWidth ,height: 20)
            Text("\(categoryName)")
                .foregroundStyle(.blue)
                
                .bold()
                
        }
    }
}

#Preview {
    MoviesCategoryView(categoryName: "example",sizeOfWidth: 50)
}
