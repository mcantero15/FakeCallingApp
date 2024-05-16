//
//  ContentView.swift
//  BluePhone
//
//  Created by Mariana Cantero-Amozoqueno on 9/22/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView {
            
            StarView()
                .tabItem {
                        Image(systemName: "star.fill")
                        Text("Favorites")
                }
            
            ClockView()
                .tabItem {
                    VStack {
                        Image(systemName: "clock.fill")
                        Text("Recents")
                    }
                }
            
            PersonView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.circle.fill")
                        Text("Contacts")
                    }
                }
            
            KeypadView()
                .tabItem {
                    VStack {
                        Image(systemName: "circle.grid.3x3.fill")
                        Text("Keypad")
                    }
                }
            
            VoicemailView()
                .tabItem {
                    VStack {
                        Image(systemName: "recordingtape")
                        Text("Voicemail")
                    }
                }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
