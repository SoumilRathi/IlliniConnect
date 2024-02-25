//
//  PostView.swift
//  HackIllinoisApp
//
//  Created by Manish Rathi on 24/02/24.
//

import SwiftUI

struct PostView: View {
    
    @State private var caption = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = UploadPostViewModel()
    @Binding var selectedIndex: Int
    
    var body: some View {
        
        VStack {
            
            HStack {
                Button {
                    caption = ""
                    
                } label: {
                    Text("Clear")
                        .foregroundColor(Color(.orange))
                }
                
                Spacer()
                
                Button {
                    viewModel.uploadPost(withText: caption)
                } label: {
                    Text("Post")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.orange))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }

            }
            .padding(15)
            
            if let user = authViewModel.currentUser {
                VStack(alignment: .leading) {
                    Text(user.username)
                        .bold()
                        .padding(4)
                        .padding(.horizontal, 4)
                    
                    TextArea("What'd you do today? Share with the world!", text: $caption)
                }
            }
            
            HStack {
                Text("Note:\n")
                    .fontWeight(.semibold)
                    .font(.caption)
                //Change this based on the current date
                Text(nextScheduledTime())
                    .fontWeight(.regular)
                    .font(.caption)
            }
            
            
                   
            
            Spacer()
        }
        .padding(5)
        .onReceive(viewModel.$didUploadTweet) { success in
            if success {
                caption = ""
                selectedIndex = 0
            }
        }
    }
    
    func nextScheduledTime() -> String {
            let calendar = Calendar.current
            
            // Get current date and time
            let currentDate = Date()
            
            // Get current year, month, and day components
            let year = calendar.component(.year, from: currentDate)
            let month = calendar.component(.month, from: currentDate)
            let day = calendar.component(.day, from: currentDate)
            
            // Set target hour and minute
            var targetComponents = DateComponents()
            targetComponents.year = year
            targetComponents.month = month
            targetComponents.day = day
            targetComponents.hour = 20 // 8 PM
            targetComponents.minute = 0  
            
            // Get the next scheduled time
            if let nextScheduledDate = calendar.nextDate(after: currentDate, matching: targetComponents, matchingPolicy: .strict) {
                // Format the date
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMM d, yyyy 'at' h:mm a"
                let formattedDate = dateFormatter.string(from: nextScheduledDate)
                
                //return "This post will be scheduled to publish on \n8PM at  \(formattedDate). \nIf you had scheduled another post today, that will be deleted."
                
                return "You get to post one post at a time. If you published another update prior to this, it will be deleted upon posting this one."
            } else {
                return "You get to post one post at a time. If you published another update prior to this, it will be deleted upon posting this one."            }
        }
}
