//
//  ContactDetailView.swift
//  BluePhone
//
//  Created by Mariana Cantero on 4/25/24.
//

import SwiftUI

struct ContactDetailView: View {
    var contact: ContactModel
    
    var body: some View {
        Text("Hello, \(contact.firstname ?? "Missing")")
    }
}

#Preview {
    ContactDetailView(contact: ContactModel(firstname: "Mary", lastname: "Can"))
}
