//
//  PersonView.swift
//  BluePhone
//
//  Created by Mariana Cantero on 11/27/23.
//

import SwiftUI
import ContactsUI

struct ContactsView: View {
    var wordList : [String] = ["hi", "hello"]
    @State var contactsViewModel: ContactsViewModel = ContactsViewModel()
    var body: some View
    {
        List(wordList, id: \.self) { word in
                Text(word)
        }
        .onAppear{
            contactsViewModel.getLocalContacts()
        }
        
//        NavigationStack {
//            List(contactsViewModel.localContacts) { contact in
//                NavigationLink{
//                    ContactDetailView(contact: contact)
//                        
//                } label:
//                {
//                    Text(contact.firstname ?? "")
//                }
//                Text(contact.firstname ?? "")
//                
//            }
//
//            .navigationTitle("Contacts")
//        }
        
              
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
