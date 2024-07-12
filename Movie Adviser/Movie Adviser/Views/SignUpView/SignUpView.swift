//
//  SignUpView.swift
//  Movie Adviser
//
//  Created by Can Özgür on 13.07.2024.
//

import SwiftUI

struct SignUpView: View {
    @Environment (\.dismiss) private var dismiss
    
    private var capsuleColor = Color(red: 98 / 255, green: 0 / 255 , blue: 175 / 255)
    @State private var username : String = ""
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var isRememberUser: Bool = false
    var body: some View {
        VStack(alignment:.center, spacing: 20){
            Text("Create Your Account")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            // User name Textfied
            TextField("", text: $username,prompt: Text("User name").foregroundStyle(.gray))
                .font(.subheadline)
                .foregroundStyle(.gray)
                .padding(12)
                .background(.white)
                .cornerRadius(10)
                .padding(.horizontal,24)
            // Email Textfield
            TextField("", text: $email,prompt: Text("Email").foregroundStyle(.gray))
                .font(.subheadline)
                .foregroundStyle(.gray)
                .padding(12)
                .background(.white)
                .cornerRadius(10)
                .padding(.horizontal,24)
            // Password Textfield
            SecureField("", text: $password ,prompt: Text("Password").foregroundStyle(.gray))
                .font(.subheadline)
                .foregroundStyle(.gray)
                .padding(12)
                .background(.white)
                .cornerRadius(10)
                .padding(.horizontal,24)
            // Confirm Password
            SecureField("", text: $password ,prompt: Text("Confirm Password").foregroundStyle(.gray))
                .font(.subheadline)
                .foregroundStyle(.gray)
                .padding(12)
                .background(.white)
                .cornerRadius(10)
                .padding(.horizontal,24)
            
            // Remember me button
            Toggle(isOn: $isRememberUser) {
                Text("Remember me")
            }.toggleStyle(iOSCheckboxToggleStyle())
            // Sign in Button
            Button(action: {
                
            }, label: {
                ZStack{
                    Capsule()
                        .frame(width: 300,height: 60)
                        .foregroundStyle(Color(capsuleColor))
                    Text("Sign in ")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
            })
            .padding(.bottom,40)
            
            HStack{
                Rectangle()
                    .frame(width: 100,height: 2)
                
                Text("Or Contuine With")
                    .font(.subheadline)
                Rectangle()
                    .frame(width: 100,height: 2)
            }
                .padding(.bottom)
            
            HStack(spacing:20){
                // Facebook
                Circle().frame(height: 60)
                // Google
                Circle().frame(height: 60)
                //Apple
                Circle().frame(height: 60)
            }.padding(.bottom,30)
            
            Button(action: {
                dismiss()
            }, label: {
                Text("Already have an account? ")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                
                + Text("Sign in")
                    .font(.headline)
                    .foregroundStyle(.purple)
                
                    .fontWeight(.semibold)
            })
           
        }
    }
}

#Preview {
    SignUpView().preferredColorScheme(.dark)
}

