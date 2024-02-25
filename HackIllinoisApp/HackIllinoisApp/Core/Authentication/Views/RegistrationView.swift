//
//  RegistrationView.swift
//  HackIllinoisApp
//
//  Created by Soumil Rathi on 24/02/24.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var confirm_password = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
            //parent container
            VStack {
                
                //HeaderView
                HStack {
                    
                    //Maybe add the Illinois logo here
                    
                    VStack(alignment: .leading) {
                        HStack{
                            Spacer()
                        }
                        Text("IlliniConnect")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .padding(.vertical, 4)
                        
                        Text("Find cool people!")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                    }
                    .frame(height: 260)
                    .padding(.leading)
                    .background(Color(.orange))
                    .foregroundColor(.white)
                    .clipShape(RoundedShape(corners: [.bottomRight]))
                }
                
                
                VStack(spacing: 40) {
                    CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                    
                    CustomInputField(imageName: "person", placeholderText: "Username", text: $username)
                    
                    CustomInputField(imageName: "lock", placeholderText: "Password", isSecureField: true , text: $password)
                    
                    CustomInputField(imageName: "lock", placeholderText: "Confirm Password", isSecureField: true , text: $confirm_password)
                }
                .padding(.horizontal, 32)
                .padding(.top, 44)
                
                
                Button {
                    
                    showAlert = false
                    
                    if (!email.hasSuffix("@illinois.edu")) {
                        showAlert = true
                        alertMessage = "You must sign up with a @illinois.edu email :)"
                        return
                    }
                    
                    if (password != confirm_password) {
                        print("These aren't equal")
                        showAlert = true
                        alertMessage = "Passwords do not match!"
                        return
                    }
                    
                    viewModel.register(withEmail: email, password: password, username: username) { alert in
                        showAlert = alert != nil
                        alertMessage = alert ?? ""
                    }
                    
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 250, height: 50)
                        .background(Color(.orange))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                
                if showAlert {
                    Text(alertMessage)
                        .font(.body)
                        .foregroundColor(Color(.red))
                        .fontWeight(.semibold)
                }
                
                
                Spacer()
                
                
                NavigationLink {
                    LoginView()
                        .navigationBarHidden(true)
                } label: {
                    HStack {
                        Text("Have an account?")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Text("Sign in instead!")
                            .font(.footnote)
                            .fontWeight(.bold)
                        
                    }
                    
                }
                .padding(.bottom, 32)
                .foregroundColor(.orange)
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            
        }
        
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
