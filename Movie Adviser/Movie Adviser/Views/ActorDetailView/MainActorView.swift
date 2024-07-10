//
//  MainActorView.swift
//  Movie Adviser
//
//  Created by Can Özgür on 10.07.2024.
//

import SwiftUI

struct MainActorView: View {
    var body: some View {
        NavigationStack{
            ScrollView(.vertical){
                VStack(alignment:.leading){
                    // Image And Rating Of IMDB
                    ZStack(alignment: .bottomLeading){
                        Rectangle()
                            .frame(maxWidth: .infinity)
                            .frame(height: 460)
                            .foregroundStyle(.red)
                        ZStack(){
                            Capsule()
                                .foregroundStyle(.white)
                                .frame(width: 140,height: 40)
                                .opacity(0.3)
                                .padding()
                            Text("Top 107 IMDB")
                        }
                        
                    }
                    
                    // Jobs And BirtDate
                    VStack(alignment: .leading) {
                        HStack{
                            Text("Actress")
                                .foregroundStyle(.gray)
                                .bold()
                            Text("Producer")
                                .foregroundStyle(.gray)
                                .bold()
                            Text("Writer")
                                .foregroundStyle(.gray)
                                .bold()
                            Spacer()
                            //Month Day Year
                            Text("June 19, 1978")
                                .foregroundStyle(.gray)
                                .bold()
                        }
                        Text("Zoe Saldana")
                            .font(.title)
                            .bold()
                        
                        Text("Zoe Saldana, born Zoe Yadira Saldaña-Perego on June 19, 1978, in Passaic, New Jersey, is an American actress of Dominican and Puerto Rican descent. She has been active in the entertainment industry since 1999. Saldana is renowned for her roles in blockbuster films and franchises. Notably, she played Neytiri in `Avatar` (2009) and its sequels, Gamora in the `Guardians of the Galaxy` series and other Marvel Cinematic Universe films, and Uhura in the `Star Trek` series. She also appeared as Anamaria in `Pirates of the Caribbean: The Curse of the Black Pearl` (2003).")
                            .lineLimit(7)
                        
                        Text("Movies")
                            .font(.title2)
                            .bold()
                            .padding(.top)
                        
                        // Actorun Adi girilicek suanda olan sey ise Directore gore film bulmasidir
                        
                        ActorMoviesListView(actorName: "James Cameron")
                        
                    }.padding(.horizontal)
                    
                }
            }
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)

        }
        .ignoresSafeArea()
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MainActorView()
}
