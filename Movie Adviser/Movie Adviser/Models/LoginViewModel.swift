//
//  LoginViewModel.swift
//  Movie Adviser
//
//  Created by Can Özgür on 15.07.2024.
//

import Foundation
import FirebaseAuth

class LoginViewModel : ObservableObject{
    @Published var currentUserId: String = ""
    
    init(){
        Auth.auth().addStateDidChangeListener { [weak self] _,user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    public var isSignedIn : Bool {
        print("okey")
        return Auth.auth().currentUser != nil
    }
}
