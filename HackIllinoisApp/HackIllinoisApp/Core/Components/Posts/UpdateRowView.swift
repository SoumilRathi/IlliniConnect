//
//  UpdateRowView.swift
//  HackIllinoisApp
//
//  Created by Soumil Rathi on 23/02/24.
//

import SwiftUI
import Firebase

struct UpdateRowView: View {
    let post: Post
    @State private var conversationID: String?
    @StateObject var conversationManager = ConversationManager()
    @State private var shouldNavigate = false
    var body: some View {
        
        //Actual update row
        VStack(alignment: .center) {
            //Message info + Action buttons
            HStack(alignment: .center, spacing: 12) {
                
                //Username + Message
                VStack(alignment: .leading, spacing: 10) {
                    
                    
                    if let user = post.user {
                        Text(user.username)
                            .font(.subheadline).bold()
                    }
                    
                    
                    Text(post.text)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
                .padding(15)
                
                Spacer()
                
                //Create the action button to message the poster here
                
                NavigationLink(destination: ChatView(conversationID: conversationID ?? ""), isActive: $shouldNavigate) {
                    Button(action: {
                        if let currentUserUID = Auth.auth().currentUser?.uid, currentUserUID != post.uid {
                            conversationManager.findOrCreateConversationID(withUID: currentUserUID, andUID: post.uid) { result in
                                switch result {
                                case .success(let id):
                                    self.conversationID = id
                                    self.shouldNavigate = true // Set shouldNavigate to true when conversation ID is obtained
                                case .failure(let error):
                                    print("Error getting conversation ID: \(error.localizedDescription)")
                                    // Optionally handle the error here
                                    self.shouldNavigate = false
                                }
                            }
                        }
                    }) {
                        Image(systemName: "paperplane")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                    .padding(15)
                }
                
                /*
                 NavigationLink(isActive: $shouldNavigate) {
                 if (Auth.auth().currentUser?.uid ?? "" != post.uid) {
                 conversationManager.findOrCreateConversationID(withUID: Auth.auth().currentUser?.uid ?? "", andUID: post.uid) { result in
                 switch result {
                 case .success(let id):
                 
                 self.conversationID = id
                 
                 //START A CHAT HERE
                 ChatView(conversationID: id)
                 
                 case .failure(let error):
                 print("Error getting conversation ID: \(error.localizedDescription)")
                 self.shouldNavigate = false
                 // Optionally handle the error here
                 }
                 }
                 self.shouldNavigate = false
                 }
                 self.shouldNavigate = false
                 } label: {
                 Image(systemName: "paperplane")
                 .font(.subheadline)
                 .foregroundColor(.black)
                 }
                 
                 
                 
                 Button() {
                 //GET CONVERSATION ID HERE
                 if (Auth.auth().currentUser?.uid ?? "" != post.uid) {
                 conversationManager.findOrCreateConversationID(withUID: Auth.auth().currentUser?.uid ?? "", andUID: post.uid) { result in
                 switch result {
                 case .success(let id):
                 
                 self.conversationID = id
                 
                 //START A CHAT HERE
                 
                 case .failure(let error):
                 print("Error getting conversation ID: \(error.localizedDescription)")
                 // Optionally handle the error here
                 }
                 }
                 } else {
                 return
                 }
                 
                 } label: {
                 Image(systemName: "paperplane")
                 .font(.subheadline)
                 .foregroundColor(.black)
                 }
                 .padding(15)
                 }
                 */
                Divider()
            }
            
            
        }
        
        
    }
}

