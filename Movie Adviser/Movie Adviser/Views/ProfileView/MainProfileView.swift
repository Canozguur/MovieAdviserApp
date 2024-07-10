//
//  MainProfileView.swift
//  Movie Adviser
//
//  Created by Can Özgür on 10.07.2024.
//

import SwiftUI

struct MainProfileView: View {
    
    @State private var isDarkMode = false
    @State private var isUseWifi = false
    @State private var isNotification = false
    
    private var capsuleColor = Color(red: 40 / 255, green: 48 / 255 , blue: 61 / 255)
    var body: some View {
   
        VStack(alignment:.leading,spacing: 16){
            //TOP INFO
            HStack(alignment: .top){
                Image("canozgur")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 130,height: 130)
                
                VStack(alignment:.leading){
                    Text("Hello")
                        .foregroundStyle(.gray)
                        .padding(.top)
                    HStack{
                        Text("Can Ozgur")
                            .font(.title2)
                        Circle()
                            .frame(width: 28)
                            .overlay(
                                Image(systemName: "pencil")
                                    .foregroundStyle(Color(.systemGray))
                                    .bold()
                                
                            )
                            .foregroundStyle(capsuleColor)
                        
                    }
                }
            }
            
            Text("Prefences")
                .font(.title2)
                .bold()
            //Language Mode
            
            VStack{
                Capsule()
                    .frame(width: 375,height: 50)
                    .overlay(
                    HStack{
                        Image(systemName: "globe")
                            .foregroundStyle(.white)
                        Text("Language")
                            .foregroundStyle(.white)
                        Spacer()
                        Text("English")
                            .foregroundStyle(.gray)
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.white)
                        
                    }
                    .padding(.horizontal)
                )
            }.foregroundStyle(capsuleColor)
            // ---LANGUAGE MODE
            
            // DARK MODE
            VStack{
                Capsule()
                    .frame(width: 375,height: 50)
                    .overlay(
                    HStack{
                        Image(systemName: "moon")
                            .foregroundStyle(.white)
                        Text("Language")
                            .foregroundStyle(.white)
                        Spacer()
                        Toggle(isOn: $isDarkMode, label: {
                            
                        }).toggleStyle(SwitchToggleStyle(tint: .purple))
                        
                        .padding(.trailing)
                        
                    }
                    .padding(.horizontal)
                )
            }
            .foregroundStyle(capsuleColor)
            // --- DARK MODE
            
            //WIFI
            VStack{
                Capsule()
                    .frame(width: 375,height: 50)
                    .overlay(
                    HStack{
                        Image(systemName: "wifi")
                            .foregroundStyle(.white)
                        Text("Use only Wi-Fi")
                            .foregroundStyle(.white)
                        Spacer()
                        Toggle(isOn: $isUseWifi, label: {
                            
                        }).toggleStyle(SwitchToggleStyle(tint: .purple))
                        
                        .padding(.trailing)
                    }
                    .padding(.horizontal)
                )
            }
            .foregroundStyle(capsuleColor)

            // --- WIFI
            
            // NOTIFICATION
            VStack{
                Capsule()
                    .frame(width: 375,height: 50)
                    .overlay(
                    HStack{
                        Image(systemName: "bell")
                            .foregroundStyle(.white)
                        Text("Notification")
                            .foregroundStyle(.white)
                        Spacer()
                        Toggle(isOn: $isNotification, label: {
                            
                        }).toggleStyle(SwitchToggleStyle(tint: .purple))
                        
                        .padding(.trailing)
                        
                    }
                    .padding(.horizontal)
                )
            }
            .foregroundStyle(capsuleColor)

            // --- NOTIFICATION
            
            // SUBSCRIPTION
            VStack{
                Capsule()
                    .frame(width: 375,height: 50)
                    .overlay(
                    HStack{
                        Image(systemName: "checkmark.seal")
                            .foregroundStyle(.white)
                        Text("Subscription")
                            .foregroundStyle(.white)
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.white)
                            .bold()
                        
                    }
                    .padding(.horizontal)
                )
            }
            .foregroundStyle(capsuleColor)

            //---SUBSCRIPTION
            Spacer()
        }
    }
}
    



#Preview {
    MainProfileView().preferredColorScheme(.dark)
}
