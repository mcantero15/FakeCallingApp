//
//  UserModel.swift
//  BluePhone
//
//  Created by Mariana Cantero on 4/3/24.
//

import Foundation
import Contacts
import UIKit

struct ContactModel: Identifiable, Hashable{
    var id: UUID = UUID()
    var firstname: String?
    var lastname: String?
    var phonenumbers: [CNLabeledValue<CNPhoneNumber>]?
//    var image: Data
}
