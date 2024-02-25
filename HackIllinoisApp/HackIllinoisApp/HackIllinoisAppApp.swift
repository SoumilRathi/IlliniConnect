//
//  HackIllinoisAppApp.swift
//  HackIllinoisApp
//
//  Created by Manish Rathi on 23/02/24.
//

import SwiftUI
import Firebase

@main
struct HackIllinoisAppApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
