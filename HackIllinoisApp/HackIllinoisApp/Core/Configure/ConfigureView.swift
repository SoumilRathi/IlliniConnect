//
//  ConfigureView.swift
//  HackIllinoisApp
//
//  Created by Manish Rathi on 24/02/24.
//

import SwiftUI

struct ConfigureView: View {
    var body: some View {

        VStack {
            Spacer()
            
            NavigationLink {
                ProfileView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Image(systemName: "arrowshape.backward")
                    
                    Text("Back")
                }
                .foregroundColor(.black)
            }
        }
        
    }
}

struct ConfigureView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigureView()
    }
}
