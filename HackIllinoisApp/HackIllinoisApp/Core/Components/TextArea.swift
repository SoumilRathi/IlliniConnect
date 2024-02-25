//
//  TextArea.swift
//  HackIllinoisApp
//
//  Created by Manish Rathi on 24/02/24.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            if text.isEmpty {
                   Text(placeholder)
                       .foregroundColor(Color(.placeholderText))
                       .onTapGesture {
                           // Hide the placeholder when tapped
                           text = ""
                       }
                       .padding(4)
                       .padding(.vertical, 4)
                       .padding(.horizontal, 4)
                       .frame(height: 200, alignment: .top)
                
                TextField("", text: $text)
                    .font(.body)
                    .padding(4)
                    .padding(.vertical, 4)
                
                    .padding(.horizontal, 4)
                    .frame(height: 200, alignment: .top)
               } else {
                   // Use TextEditor for real text input
                   TextEditor(text: $text)
                       .font(.body)
                       .padding(.horizontal, 4)
                       .frame(height: 200, alignment: .top)
               }
            
           
        }
    }
}


