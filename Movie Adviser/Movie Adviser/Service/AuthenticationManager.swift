//
//  AuthenticationManager.swift
//  Movie Adviser
//
//  Created by Can Özgür on 15.07.2024.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid : String
    let email : String?
    let photoUrl : String?
    
    init(user : User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

final class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    
    private init() {}
    
    
    func getAuthenticationUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else{
            throw URLError(.badServerResponse)
        }
        print(user.uid)
        return AuthDataResultModel(user: user)
    }
    
    // Yeni kullanici yaratmak icin kullandigimiz fonksityon
    @discardableResult
    func createUser(email: String, password : String) async throws -> AuthDataResultModel {
        // olusturulan kullanici bilgisini sonucunu sabit degiskene aiyoruz
        let authDataReesult =  try await Auth.auth().createUser(withEmail: email, password: password)
        // atadigimiz degiskenin bilgilerini olusturdugumuz Modelin icinde fonksiyonla sonucunu donduruyoruz
        return AuthDataResultModel(user: authDataReesult.user)
    }
    @discardableResult
    func SignInUser(email: String, password : String) async throws -> AuthDataResultModel {
        // olusturulan kullanici bilgisini sonucunu sabit degiskene aiyoruz
        let authDataReesult =  try await Auth.auth().signIn(withEmail: email, password: password)
        // atadigimiz degiskenin bilgilerini olusturdugumuz Modelin icinde fonksiyonla sonucunu donduruyoruz
        return AuthDataResultModel(user: authDataReesult.user)
    }
    // kullanirken bu fonksiyonu throws ve try kullanimi gerekli olucak
    func signOut() throws {
        try Auth.auth().signOut()
    }
    
    func resetPassword(email:String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func updatePassword(password: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        try await user.updatePassword(to: password)
    }
    
    func updateEmail(email: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        try await user.sendEmailVerification(beforeUpdatingEmail: email)
    }

    
    
}
