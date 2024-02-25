//
//  ChatViewModel.swift
//  HackIllinoisApp
//
//  Created by Soumil Rathi on 25/02/24.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


class ChatViewModel: ObservableObject {
    
    @Published var messages = [Message]()
    @Published var username: String = ""
    let userService = UserService()
    
    func loadConversation(conversationID: String) {
        print("Okay so atleast I reached here!!!")
        
        let db = Firestore.firestore()
        let conversationRef = db.collection("Conversations").document(conversationID)
        conversationRef.getDocument { document, error in
            guard let document = document else {
                print("Conversation document not found")
                return
            }
            
            // Access the data from the document
            let data = document.data()
            
            if let data = data, let uid2 = data["uid2"] as? String,Auth.auth().currentUser?.uid ?? "" != uid2  {
                self.userService.fetchUser(withUid: uid2) { user in
                    self.username = user.username
                    print(self.username)
                    print(uid2)
                }
            } else if let data = data, let uid1 = data["uid1"] as? String,Auth.auth().currentUser?.uid ?? "" != uid1 {
                self.userService.fetchUser(withUid: uid1) { user in
                    self.username = user.username
                    print(self.username)
                    print(uid1)
                }
                
            }
            // Process the data as needed
            print("Conversation document data: \(self.username)")
        }
    }
}
