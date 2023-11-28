//
//  CallOption.swift
//  BluePhone
//
//  Created by Mariana Cantero on 11/28/23.
//

import Foundation
import SwiftUI

struct CallOption: Identifiable {     //will follow identifiable protocol
    var id: UUID = UUID() //have to add an ID in order to conform to the rules of identifiable, and sets it to a new instance                      of UUID so that it can create and assign it an ID
    var name: String    //a property of CallOption
    var duration: String
    var day: String
    var icon: String = "info.circle"
}

//functions inside a structure is called a method 
//variables and functions start with lowercase
//structs start with uppercase
