//
//  ProfileView.swift
//  HackIllinoisApp
//
//  Created by Manish Rathi on 24/02/24.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        if let user = viewModel.currentUser {
            VStack(alignment: .leading) {
                
                HStack {
                    Text(user.username.lowercased())
                        .fontWeight(.semibold)
                        .font(.title)
                        .padding(.bottom, 5)
                    
                    
                    Spacer()
                    
                    Image(systemName: "pencil")
                        .font(.title)
                }
                
                
                
                Text(verbatim: user.email.lowercased())
                    .fontWeight(.semibold)
                    .font(.title2)
                    .foregroundColor(.gray)
                
                
                    .padding(.bottom, 15)
                
                
                
                Divider()
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                
                //Settings Button
                
                /*NavigationLink {
                    ConfigureView()
                        .navigationBarHidden(true)
                } label: {
                    HStack {
                        Image(systemName: "gear")
                        
                        Text("Configure")
                    }
                    .foregroundColor(.black)
                }
                
                
                Divider()
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                */
                //Logout button
                Button {
                    viewModel.signOut()
                } label: {
                    HStack {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                        
                        Text("Sign Out")
                    }
                    .foregroundColor(.black)
                }
                
                Spacer()
            }
            .frame(
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .padding(50)
        }
        
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
