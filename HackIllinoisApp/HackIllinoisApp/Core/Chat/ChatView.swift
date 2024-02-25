//
//  ChatView.swift
//  HackIllinoisApp
//
//  Created by Manish Rathi on 24/02/24.
//

import SwiftUI
import Firebase

struct ChatView: View {
    
    @StateObject var messagesManager = MessagesManager()
    @ObservedObject var viewModel = ChatViewModel()
    let conversationID: String
    
    var body: some View {
        
        VStack {
            
            //Title Row
            HStack {
                
                Spacer()
                
                Text(viewModel.username)
                    .fontWeight(.semibold)
                    .font(.title)
                    .frame(alignment: .topLeading)
                
                Spacer()
                    

            }
            .padding(.leading, 40)
            .padding(.top, 50)
            .frame(height: 150)
            .background(Color(.orange).opacity(0.5))
            .clipShape(RoundedShape(corners: [.bottomRight]))
            .ignoresSafeArea()
            
            ScrollView {
                ForEach(messagesManager.messages, id: \.id) { message in
                    MessageBubble(message: message)
                }
                
            }
            .padding(.top, -50)
            
            Spacer()
            
            MessageField()
                .environmentObject(messagesManager)
            
        
        }
        .onAppear {
            viewModel.loadConversation(conversationID: conversationID)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(conversationID: "CQHgGBNHs6aRNkwCvyY9")
    }
}
