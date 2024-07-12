//
//  SignInMainView.swift
//  Movie Adviser
//
//  Created by Can Özgür on 12.07.2024.
//

import SwiftUI

struct SignInMainView: View {
    private var capsuleColor = Color(red: 98 / 255, green: 0 / 255 , blue: 175 / 255)
    var body: some View {
        NavigationStack {
            HStack{
                Text("Welcome to")
                    .font(.title)
                    .bold()
                Text("Movie Adviser")         
                    .font(.title)
                    .foregroundStyle(.purple)
                    .bold()
            }.padding(.top,30)
            
            Spacer()
            // Sign in with password Button
            NavigationLink(
                destination: SignInView(),
                label: {
                    ZStack{
                        Capsule()
                            .frame(width: 300,height: 60)
                            .foregroundStyle(capsuleColor)
                        Text("Sign in with password")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                        
                    }
                }
            )
                
            
            
            HStack{
                Rectangle()
                    .frame(width: 100,height: 2)
                
                Text("Or Contuine With")
                    .font(.subheadline)
                Rectangle()
                    .frame(width: 100,height: 2)
            }.padding(.top,30)
                .padding(.bottom)
            
            HStack(spacing:20){
                // Facebook
                Circle().frame(height: 60)
                // Google
                Circle().frame(height: 60)
                //Apple
                Circle().frame(height: 60)
            }.padding(.bottom,70)
            
            NavigationLink(
                destination: SignUpView(),
                label: {
                    Text("Don`t have an account? ")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                    
                    + Text("Sign up")
                        .font(.headline)
                        .foregroundStyle(.purple)
                    
                        .fontWeight(.semibold)
                    
                })
                
            
            
            
        }
    }
}


#Preview {
    SignInMainView().preferredColorScheme(.dark)
}
