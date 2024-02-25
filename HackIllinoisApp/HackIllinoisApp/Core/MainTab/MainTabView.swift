//
//  MainTabView.swift
//  HackIllinoisApp
//
//  Created by Manish Rathi on 23/02/24.
//

import SwiftUI

struct MainTabView: View {
    @State var selectedIndex = 0
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .onTapGesture {
                    self.selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(0)
            
            PostView(selectedIndex: $selectedIndex)
                .onTapGesture {
                    self.selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "plus")
                }.tag(1)
            
            MessagesView()
                .onTapGesture {
                    self.selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "person.3")
                }.tag(2)
             
            ProfileView()
                .onTapGesture {
                    self.selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }.tag(3)
        }
        
    }
    

}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
