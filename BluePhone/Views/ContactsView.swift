//
//  PersonView.swift
//  BluePhone
//
//  Created by Mariana Cantero on 11/27/23.
//

import SwiftUI
import ContactsUI

struct ContactsView: View {
    //var wordList : [String] = ["hi", "hello"]
    @EnvironmentObject var contactsViewModel: ContactsViewModel
    @State private var path = NavigationPath()
   
    
    
    var body: some View
    {
        let sortedContacts = contactsViewModel.localContacts.sorted(by: {$0.lastname < $1.lastname})
        
        var firstCharacters : [Character] {
            var firstCharacters = [Character]()
            for contact in sortedContacts {
                if let character = contact.lastname.first, !firstCharacters.contains(character) {
                    firstCharacters.append(character)
                }
            }
            return firstCharacters
        }
        
        
        NavigationStack(path: $path){
            List{
                ForEach(firstCharacters, id: \.self) { character in
                    Section(header: Text(String(character))) {
                        ForEach(sortedContacts.filter({
                            if $0.lastname == ""
                            {
                                $0.firstname.first == character
                            }
                            else {
                                $0.lastname.first == character
                            }
                                })) { contact in
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
