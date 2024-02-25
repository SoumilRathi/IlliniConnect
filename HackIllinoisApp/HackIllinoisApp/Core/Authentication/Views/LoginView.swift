//
//  LoginView.swift
//  HackIllinoisApp
//
//  Created by Manish Rathi on 24/02/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
            //parent containe
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
                    CustomInputField(imageName: "envelope",
                                     placeholderText: "Email",
                                     text: $email)
                    
                    CustomInputField(imageName: "lock",
                                     placeholderText: "Password",
                                     isSecureField: true ,
                                     text: $password)
                }
                .padding(.horizontal, 32)
                .padding(.top, 44)
                
                HStack {
                    Spacer()
                    
                    NavigationLink {
                        Text("Reset Password View")
                    } label: {
                        Text("Forgot Password?")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.orange))
                    }
                    
                }
                .padding(.top)
                .padding(.trailing, 24)
                
                Button {
                    viewModel.login(withEmail: email, password: password)
                } label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 250, height: 50)
                        .background(Color(.orange))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                
                
                Spacer()
                
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarHidden(true)
                } label: {
                    HStack {
                        Text("Don't have an account?")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Text("Sign up!")
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
