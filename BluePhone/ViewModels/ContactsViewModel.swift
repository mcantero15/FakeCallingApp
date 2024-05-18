//
//  ContactsViewModel.swift
//  BluePhone
//
//  Created by Mariana Cantero on 4/3/24.
//

import Foundation
import Contacts

class ContactsViewModel: ObservableObject 
{
    @Published var localContacts: [ContactModel] = []
    //@Published var localContacts: [CNContact] = []
    func getLocalContacts() {
        //Perform the contact store method asynchonously so it doesn't block the UI
        DispatchQueue(label: "get contacts").async {
            do {
                        //Ask for permission
                        let store = CNContactStore()
                        
                        //List of keys we want to get
                        let keys = [CNContactPhoneNumbersKey,
                                    CNContactGivenNameKey,
                                    CNContactFamilyNameKey] as [CNKeyDescriptor]
                        
                        //Create a fetch request
                        let fetchRequest = CNContactFetchRequest(keysToFetch: keys)
                        
                        //Get the contacts on the user's phone
                        try store.enumerateContacts(with: fetchRequest, usingBlock: { contact, success in
                            // do something
                            DispatchQueue.main.async {
                                //self.localContacts.append(contact)
                                self.localContacts.append(ContactModel(firstname: contact.givenName, lastname: contact.familyName, phonenumbers: contact.phoneNumbers))
                            }
                        })
                    }
                    catch {
                        //Handle error
                    }
        }
        
        
        
        
        
    }
}
