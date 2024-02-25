//
//  FeedViewModel.swift
//  HackIllinoisApp
//
//  Created by Manish Rathi on 24/02/24.
//

import Foundation


class FeedViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    let service = PostService()
    let userService = UserService()
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        service.fetchPosts { posts in
            self.posts = posts
            
            
            
            for i in 0 ..< posts.count {
                let uid = posts[i].uid
                
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.posts[i].user = user
                }
                
            }
            
        }
    }
    
}
