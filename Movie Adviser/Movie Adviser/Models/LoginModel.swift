//
//  LoginModel.swift
//  Movie Adviser
//
//  Created by Can Özgür on 15.07.2024.
//

import Foundation

@MainActor
final class LoginModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    //kullanicinin kayit olmasini sagliyor
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else{
            print("No email or password found")
            return
        }
      
        let authDataResult = try await AuthenticationManager.shared.createUser(email: email, password: password)
        try await UserManager.shared.createNewUser(auth: authDataResult)
        
        print("Success")
    }
    // Kullanicini giris yapmasini Sagliyo
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else{
            print("No email or password found")
            return
        }
      
        try await AuthenticationManager.shared.SignInUser(email: email, password: password)
        print("Success")
    }
}
