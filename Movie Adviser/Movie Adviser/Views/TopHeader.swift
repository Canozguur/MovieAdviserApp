//
//  TopHeader.swift
//  Movie Adviser
//
//  Created by Can Özgür on 7.07.2024.
//

import SwiftUI

struct TopHeader: View {
    @State var name : String
    @State var imdb : Float
    @State var isSaved : Bool
    @StateObject private var movieService = MovieService()
    var body: some View {
        ZStack(alignment: .bottomLeading){
            Image("avatar")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: 460)
                
                
            
            VStack(alignment:.leading){
                HStack{
                    Image("imdb")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40,height: 20)
                        .foregroundColor(.red)
                    Text("\(String(format: "%.1f", imdb))")
                        .foregroundStyle(.white)
                    
                }
                Text("\(name)")
                    .foregroundStyle(.white)
                    .bold()
                    .font(.title3)
                    
                HStack{
                    // watch now button
                    Button(action: {
                        
                    }, label: {
                        ZStack{
                            Rectangle()
                                .frame(width: 180,height: 40)
                                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                .foregroundStyle(.blue)
                            Text("Watch Now")
                                .foregroundStyle(.white)
                                .bold()
                                
                        }
                        
                    })
                    
                    // add favorite button
                    Button(action: {
                        isSaved.toggle()
                        print(isSaved)
                    }, label: {
                        ZStack(alignment:.center){
                            
                            Circle().frame(width: 40)
                                .foregroundColor(.gray)
                            Image(systemName: isSaved ?  "bookmark" :"bookmark.fill" )
                                .foregroundColor(isSaved ? .white : .red)
                        }
                        
                    })
                    
                }
                .padding(.top,5)
            }.padding()
        }
        
    }
}

#Preview {
    TopHeader(name: "Avatar", imdb: 8.7,isSaved: false)
}
