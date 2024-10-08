//
//  BluePhoneApp.swift
//  BluePhone
//
//  Created by Mariana Cantero on 9/22/23.
//

import SwiftUI

@main
struct BluePhoneApp: App {
    
    @StateObject var callOptionViewModel: CallOptionViewModel = CallOptionViewModel()
    @StateObject var contactsViewModel: ContactsViewModel = ContactsViewModel()
    //@Bindable private var baseRouter = BaseRouter()
    var body: some Scene {
        WindowGroup {
            
                MainView()
            .environmentObject(callOptionViewModel)
            .environmentObject(contactsViewModel)
            //.environment(baseRouter)
        }
        
    }
}
