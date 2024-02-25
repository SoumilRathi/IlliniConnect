//
//  USer.swift
//  HackIllinoisApp
//
//  Created by Soumil Rathi on 24/02/24.
//

import FirebaseFirestoreSwift

struct AppUser: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let email: String
    //Also need to add the recent update
}
