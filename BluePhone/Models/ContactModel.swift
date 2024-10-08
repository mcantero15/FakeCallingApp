//
//  UserModel.swift
//  BluePhone
//
//  Created by Mariana Cantero on 4/3/24.
//

import Foundation
import Contacts

struct ContactModel: Identifiable, Hashable{
    var id: UUID = UUID()
    var firstname: String
    var lastname: String
    var phonenumbers: [CNLabeledValue<CNPhoneNumber>]
    
    init(firstname: String?, lastname: String?, phonenumbers: [CNLabeledValue<CNPhoneNumber>]?) {
        self.firstname = firstname ?? ""
        self.lastname = lastname ?? ""
        self.phonenumbers = phonenumbers ?? []
    }
    
    
    func fullName() -> String {
        return "\(firstname) + \(lastname)"
    }
    
}
