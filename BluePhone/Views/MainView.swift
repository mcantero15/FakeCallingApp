//
//  ContentView.swift
//  BluePhone
//
//  Created by Mariana Cantero-Amozoqueno on 9/22/23.
//

import SwiftUI

struct MainView: View {
    //@EnvironmentObject var callOptionViewModel : CallOptionViewModel
    @EnvironmentObject var contactsViewModel: ContactsViewModel
    //@State private var string = ""
    var body: some View {
        
        TabView {
            AlarmView()
                .tabItem {Label("Alarm", systemImage: "speaker.badge.exclamationmark.fill")}
            
            
            MakeCallView()
            .tabItem {Label("Call", systemImage: "phone.arrow.up.right.fill")}
            
            ContactsView()
                .tabItem {Label("Contacts", systemImage: "person.circle.fill")}
            
            KeypadView()
                .tabItem {Label("Keypad", systemImage: "circle.grid.3x3.fill")}
            
            ReceiveCallView()
                .tabItem {Label("Receive", systemImage: "phone.arrow.down.left.fill")}
        }.onAppear() {
            //callOptionViewModel.getItems()
            contactsViewModel.getLocalContacts()

            let standardAppearance = UITabBarAppearance()
                   
                   standardAppearance.configureWithOpaqueBackground()
                   standardAppearance.shadowColor = .black.withAlphaComponent(0.3)
                   
                   UITabBar.appearance().standardAppearance = standardAppearance
                   UITabBar.appearance().scrollEdgeAppearance = standardAppearance
        }
        
    }
        
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            MainView()
        }
        .environmentObject(CallOptionViewModel())  
        .environmentObject(ContactsViewModel())//have to add this to MainView so that MakeCallView doesn't crash
        //.environmentObject(ContactsViewModel())

    }
}
