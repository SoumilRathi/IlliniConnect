//
//  ConversationManager.swift
//  HackIllinoisApp
//
//  Created by Manish Rathi on 25/02/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


class ConversationManager: ObservableObject {
    
    func findOrCreateConversationID(withUID uid1: String, andUID uid2: String, completion: @escaping (Result<String, Error>) -> Void) {
        let db = Firestore.firestore()
        
        // Check if a conversation already exists between the two users
        checkConversationExists(db: db, uid1: uid1, uid2: uid2) { result in
            switch result {
            case .success(let conversationID):
                completion(.success(conversationID))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func checkConversationExists(db: Firestore, uid1: String, uid2: String, completion: @escaping (Result<String, Error>) -> Void) {
        // Check if a conversation exists where uid1 = uid1 and uid2 = uid2
        db.collection("Conversations")
            .whereField("uid1", isEqualTo: uid1)
            .whereField("uid2", isEqualTo: uid2)
            .getDocuments { snapshot, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                if let document = snapshot?.documents.first {
                    let conversationID = document.documentID
                    completion(.success(conversationID))
                } else {
                    // If no conversation found, check if a conversation exists where uid1 = uid2 and uid2 = uid1
                    self.checkReverseConversationExists(db: db, uid1: uid1, uid2: uid2, completion: completion)
                }
            }
    }

    func checkReverseConversationExists(db: Firestore, uid1: String, uid2: String, completion: @escaping (Result<String, Error>) -> Void) {
        db.collection("Conversations")
            .whereField("uid1", isEqualTo: uid2)
            .whereField("uid2", isEqualTo: uid1)
            .getDocuments { snapshot, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                if let document = snapshot?.documents.first {
                    let conversationID = document.documentID
                    completion(.success(conversationID))
                } else {
                    // If no conversation found, create a new conversation
                    self.createConversation(db: db, uid1: uid1, uid2: uid2, completion: completion)
                }
            }
    }

    func createConversation(db: Firestore, uid1: String, uid2: String, completion: @escaping (Result<String, Error>) -> Void) {
        let newConversationRef = db.collection("Conversations").document()
        let newConversationID = newConversationRef.documentID
        let conversationData: [String: Any] = ["uid1": uid1,
                                                "uid2": uid2]
        
        newConversationRef.setData(conversationData) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(newConversationID))
            }
        }
    }
    
}



