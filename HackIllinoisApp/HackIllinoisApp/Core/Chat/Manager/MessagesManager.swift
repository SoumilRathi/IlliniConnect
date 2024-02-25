//
//  MessagesManager.swift
//  HackIllinoisApp
//
//  Created by Manish Rathi on 24/02/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    let db = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    func getMessages() {
        db.collection("messages").addSnapshotListener {querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching messages")
                return
            }
            
            self.messages = documents.compactMap { document -> Message? in
                do {
                    return try document.data(as: Message.self)
                } catch {
                    print("Error converting document into a Message")
                    return nil
                }
            }
            
            self.messages.sort {$0.timestamp < $1.timestamp}
        }
    }
    
    func sendMessage(message: String) {
        do {
            let newMessage = Message(id: "\(UUID())", text: message, received: false, timestamp: Date())
            
            try db.collection("messages").document().setData(from: newMessage)
        } catch {
            print("Error sending the message..")
        }
    }
}

