//
//  UploadPostViewModel.swift
//  HackIllinoisApp
//
//  Created by Manish Rathi on 24/02/24.
//

import Foundation


class UploadPostViewModel: ObservableObject {
    @Published var didUploadTweet = false
    let service = PostService()
    
    func uploadPost(withText text: String) {
        service.uploadPost(text: text) { success in
            if (success) {
                self.didUploadTweet = true
            } else {
                //Show user the error message
            }
            
        }
    }

}
