//
//  UserService.swift
//  HackIllinoisApp
//
//  Created by Manish Rathi on 24/02/24.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserService {
    
    func fetchUser(withUid uid: String, completion: @escaping(AppUser) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument {snapshot, _ in
                
                guard let snapshot = snapshot else {return}
                
                guard let user = try? snapshot.data(as: AppUser.self) else {return}
                completion(user)
                
                
            }
    }
}
