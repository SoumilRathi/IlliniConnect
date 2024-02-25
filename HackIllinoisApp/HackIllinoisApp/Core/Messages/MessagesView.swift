//
//  MessagesView.swift
//  HackIllinoisApp
//
//  Created by Manish Rathi on 24/02/24.
//

import SwiftUI

enum Tab {
    case messages
    case requests
}

struct MessagesView: View {
    @State private var selectedTab: Tab = .messages
    var body: some View {
        
        VStack {
            
            //Invite others
            
            Divider()
                .padding()
                .padding(.top, 50)
            
            Button {
                //Invite others
            } label: {
                HStack() {
                    Image(systemName: "person.badge.plus")
                    
                    Text("Invite your Friends!")
                    
                    Spacer()
                }
                .font(.title3)
                .padding(.leading, 20)
            }
            .foregroundColor(.black)
            
            Divider()
                .padding()
            
            HStack(spacing: 50) {
                TabText(title: "Messages", isSelected: selectedTab == .messages) {
                    selectedTab = .messages
                }
                
                TabText(title: "Requests", isSelected: selectedTab == .requests) {
                    selectedTab = .requests
                }
            }
            
            
            // Content based on selected tab
            if selectedTab == .messages {
                IncomingMessagesView()
            } else {
                RequestsView()
            }
            
            Spacer()
            
        }
        
    }
}

struct SingleMessage: View {
    var body: some View {
        Text("This is a single message lol")
    }
}

struct TabText: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundColor(isSelected ? .orange : .black)
            .padding()
            .onTapGesture(perform: action)
    }
}


struct IncomingMessagesView: View {
    var body: some View {
        
        VStack {
            
            HStack {
                
                VStack(alignment: .leading) {
                    Text("student3")
                        .fontWeight(.semibold)
                        .padding(.bottom, 5)
                    
                    Text("Fun! Would love to join someday")
                        .foregroundColor(Color(.gray))
                }
                
                
                Spacer()
            }
            
            Divider()
                .padding(.top, 15)
                .padding(.bottom, 15)
            
            HStack {
                
                VStack(alignment: .leading) {
                    Text("student1")
                        .fontWeight(.semibold)
                        .padding(.bottom, 5)
                    
                    Text("Hey! Love what you're doing, let's chat!")
                        .foregroundColor(Color(.gray))
                }
                
                
                Spacer()
            }
            
            Divider()
                .padding(.top, 15)
                .padding(.bottom, 15)
            
            
        }
        .padding(.top, 20)
        .padding(.leading, 20)
    }
}

struct RequestsView: View {
    var body: some View {
        Text("No requests for you yet :(")
            .foregroundColor(Color(.gray))
    }
}


struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
