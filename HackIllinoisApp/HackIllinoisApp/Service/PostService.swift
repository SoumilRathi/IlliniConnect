//
//  PostService.swift
//  HackIllinoisApp
//
//  Created by Manish Rathi on 24/02/24.
//

import Firebase
import FirebaseFirestore

struct PostService {
    
    func uploadPost(text: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        Firestore.firestore().collection("posts")
                .whereField("uid", isEqualTo: uid)
                .getDocuments { snapshot, error in
                    guard let snapshot = snapshot, error == nil else {
                        print("Error fetching previous posts: \(error)")
                        completion(false)
                        return
                    }
                    
                    // Iterate through the documents (posts)
                    for document in snapshot.documents {
                        // Delete each previous post
                        Firestore.firestore().collection("posts")
                            .document(document.documentID)
                            .delete { error in
                                if let error = error {
                                    print("Error deleting previous post: \(error)")
                                    completion(false)
                                    return
                                }
                                
                                // After deleting the previous post, upload the new post
                                uploadNewPost(uid: uid, text: text, completion: completion)
                            }
                    }
                    
                    // If no previous posts found, directly upload the new post
                    if snapshot.documents.isEmpty {
                        uploadNewPost(uid: uid, text: text, completion: completion)
                    }
                }
        }

        private func uploadNewPost(uid: String, text: String, completion: @escaping (Bool) -> Void) {
            let data = ["uid": uid,
                        "text": text,
                        "timestamp": Timestamp(date: Date())] as [String: Any]
            
            Firestore.firestore().collection("posts").addDocument(data: data) { error in
                if let error = error {
                    print("Upload failed: \(error)")
                    completion(false)
                    return
                }
                completion(true)
            }
        }
    
    func fetchPosts(completion: @escaping([Post])->Void) {
        Firestore.firestore().collection("posts").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else {return }
            let posts = documents.compactMap({ try? $0.data(as: Post.self) })
            completion(posts)
        }
    }
}
