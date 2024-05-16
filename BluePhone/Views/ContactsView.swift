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
    @EnvironmentObject var contactsViewModel: ContactsViewModel
    @State private var path = NavigationPath()
    var body: some View
    {
        NavigationStack(path: $path){
            List{
                ForEach(contactsViewModel.localContacts) { contact in
                    Button(action: {
                        path.append(contact)
                    }, label: {
                        ContactListRowView(contact: contact)
                            .contentShape(Rectangle())
                    })
                    .buttonStyle(PlainButtonStyle())
//                    NavigationLink{
//                        ContactDetailView(contact: contact)
//                    } label: {
//                        Text(contact.firstname ?? "Hi")
//                            .bold()
//                    }
                    
                }
            }
            .navigationTitle("Contacts")
            .listStyle(.plain)
            .navigationDestination(for: ContactModel.self) { contact in
                ContactDetailView(contact: contact)
            }
//            .onAppear{
//                contactsViewModel.getLocalContacts()
//            }
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
        
        NavigationStack {
            ContactsView()
        }
        .environmentObject(ContactsViewModel())
    }
}
