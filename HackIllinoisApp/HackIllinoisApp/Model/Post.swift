//
//  Post.swift
//  HackIllinoisApp
//
//  Created by Manish Rathi on 24/02/24.
//

import FirebaseFirestore
import FirebaseFirestoreSwift


struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let text: String
    //Note, this is the id of the poster of the tweet.
    let uid: String
    var user: AppUser?
    let timestamp: Date
}
