//
//  MessageField.swift
//  HackIllinoisApp
//
//  Created by Manish Rathi on 24/02/24.
//

import SwiftUI

struct MessageField: View {
    @EnvironmentObject var messagesManager: MessagesManager
    @State private var message = ""
    var body: some View {
        
        HStack {
            CustomTextField(placeholder: Text("Enter your message here!"), text: $message)
            
            Button {
                messagesManager.sendMessage(message: message)
                message = ""
            } label: {
             Image(systemName: "paperplane.fill")
                    .foregroundColor(.orange)
                    .padding(10)
                    .cornerRadius(5)
            }

        }
        .padding(.horizontal)
        .padding(.leading, 15)
        .padding(.vertical, 10)
        .background(Color(.lightGray).opacity(0.3))
        .cornerRadius(15)
        .padding()
    }
        
}


struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder.opacity(0.5)
            }
            
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
                .autocapitalization(.none)
        }
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
    }
}
