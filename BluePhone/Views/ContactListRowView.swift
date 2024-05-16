//
//  ContactListRowView.swift
//  BluePhone
//
//  Created by Mariana Cantero on 4/25/24.
//

import SwiftUI

struct ContactListRowView: View {
    var contact: ContactModel
    var body: some View {
        HStack{
            Text(contact.firstname ?? "Missing")
                .bold()
            Spacer()
        }
    }
}

#Preview {
    ContactListRowView(contact: ContactModel(firstname: "Mary", lastname: "Can"))
}
