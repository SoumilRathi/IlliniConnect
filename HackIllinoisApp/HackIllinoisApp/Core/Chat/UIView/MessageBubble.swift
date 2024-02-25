//
//  MessageBubble.swift
//  HackIllinoisApp
//
//  Created by Manish Rathi on 24/02/24.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.received ? Color(.lightGray).opacity(0.3) : Color(.orange).opacity(0.3))
                    .cornerRadius(30)
            }
            .frame(maxWidth: 250, alignment: message.received ? .leading : .trailing)


        }
        .frame(maxWidth: .infinity,
               alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
        .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 0)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "120", text: "This is a lot of work. However, I will get this done", received: true, timestamp: Date()))
    }
}
