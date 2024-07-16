//
//  SignInView.swift
//  Movie Adviser
//
//  Created by Can Özgür on 12.07.2024.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject private var model = LoginModel()
    let capsuleColor = Color(red: 98 / 255, green: 0 / 255 , blue: 175 / 255)
    
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var isRememberUser: Bool = false
    
    @Binding var showSignInView : Bool
    var body: some View {
        VStack(alignment:.center, spacing: 20){
            Text("Login to Your Account")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            // Email Textfield
            TextField("", text: $model.email,prompt: Text("Email").foregroundStyle(.gray))
                .font(.subheadline)
                .foregroundStyle(.gray)
                .padding(12)
                .background(.white)
                .cornerRadius(10)
                .padding(.horizontal,24)
            // Password Textfield
            SecureField("", text: $model.password ,prompt: Text("Password").foregroundStyle(.gray))
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
                // signIn
                Task{
                    do {
                        try await model.signIn()
                        showSignInView = false
                        return
                    }
                    catch{
                        print(error)
                    }
                }
            }, label: {
                ZStack{
                    Capsule()
                        .frame(width: 300,height: 60)
                        .foregroundStyle(capsuleColor)
                    Text("Sign in ")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
            })
            // Forgot Password
            Button(action: {
                
            }, label: {
                Text("Forgot the Password?")
                    .foregroundStyle(.gray)
            })
           
            
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
            }.padding(.bottom,70)
            
            NavigationLink(
                destination: SignUpView(showSignInView: $showSignInView),
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
    NavigationStack{
        SignInView(showSignInView:.constant(false)).preferredColorScheme(.dark)
    }
}

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // 1
        Button(action: {

            // 2
            configuration.isOn.toggle()

        }, label: {
            HStack {
                // 3
                
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .foregroundStyle( .white)
                configuration.label.foregroundStyle(.white)
            }
        })
    }
}
