//
//  FeedView.swift
//  HackIllinoisApp
//
//  Created by Soumil Rathi on 23/02/24.
//

import SwiftUI

struct FeedView: View {
    
    
    
    @ObservedObject var viewModel = FeedViewModel()
    let userService = UserService()
    var body: some View {
        
        VStack {
            
            HStack {
                //Add a selector between Around Me and Friends
            }
            
            ScrollView {
                LazyVStack {
                    
                    ForEach(viewModel.posts) { post in
                        
                        UpdateRowView(post: post)
                                                
                    }
                    
                }
            }
        }
        .onAppear {
            viewModel.fetchPosts()
        }
    }
    
    static func updateFeed() {
        FeedViewModel().fetchPosts()
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
