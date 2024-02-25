//
//  AuthViewModel.swift
//  HackIllinoisApp
//
//  Created by Soumil Rathi on 24/02/24.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import Firebase


class AuthViewModel: ObservableObject {
    
    @Published var userSession: User?
    @Published var currentUser: AppUser?
    
    private let service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) {result, error in
            if let error = error {
                print("DEBUG: Failed to login with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return}
            self.userSession = user;
            self.fetchUser()
        }
    }
    
    func register(withEmail email: String, password: String, username: String, completion: @escaping (String?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(error.localizedDescription)
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return}
            self.userSession = user;
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    print("DEBUG: Uploaded user data!")
                }
            
            self.fetchUser()
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        
        guard let uid = self.userSession?.uid else {return}
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
            print(self.currentUser?.username)
        }
    }
}
