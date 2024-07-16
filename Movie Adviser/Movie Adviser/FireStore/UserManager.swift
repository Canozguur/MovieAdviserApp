//
//  UserManager.swift
//  Movie Adviser
//
//  Created by Can Özgür on 16.07.2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct DBUser: Codable {
    let userId: String
    let email: String?
    let photoUrl: String?
    let dateCreated: Date?
//    let isPremium: Bool?
//    let preferences: [String]?
//    let favoriteMovie: Movie?
//    let profileImagePath: String?
//    let profileImagePathUrl: String?
    
//    init(auth: AuthDataResultModel) {
//        self.userId = auth.uid
//        self.email = auth.email
//        self.photoUrl = auth.photoUrl
//        self.dateCreated = Date()
//        self.isPremium = false
//        self.preferences = nil
//        self.favoriteMovie = nil
//        self.profileImagePath = nil
//        self.profileImagePathUrl = nil
//    }
}

final class UserManager {
    static let shared = UserManager()
    private init(){ }
    
    private let userCollection = Firestore.firestore().collection("users")
    
    private func userDocument(userId:String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    func createNewUser(auth: AuthDataResultModel) async throws {
        var userData : [String: Any] = [
            "user_id": auth.uid,
            "data_created" : Timestamp(),
            
        ]
        if let email = auth.email {
            userData["email"] = email
        }
        if let photoUrl = auth.photoUrl {
            userData["photo_url"] = photoUrl
        }
        
        try await userDocument(userId: auth.uid).setData(userData, merge: false)
        
    }
    func getUser(userId:String) async throws -> DBUser {
        let snapshot = try await userDocument(userId: userId).getDocument()
        
        guard let data = snapshot.data(), let userId = data["User_id"] as? String else {
            throw URLError(.badServerResponse)
        }
        
        
        let email = data["email"] as? String
        let photoUrl = data["photo_url"] as? String
        let dateCreated = data["date_created"] as? Date
        
        return DBUser(userId: userId, email: email, photoUrl: photoUrl, dateCreated: dateCreated)
    }
}
