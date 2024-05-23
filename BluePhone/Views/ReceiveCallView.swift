//
//  VoicemailView.swift
//  BluePhone
//
//  Created by Mariana Cantero on 11/27/23.
//

import SwiftUI

struct ReceiveCallView: View {
    var body: some View {
        NavigationStack {
            List {
                Text("HI")
            }.navigationTitle("Receive Call")
                .listStyle(PlainListStyle())
        }
    }
}

struct ReceiveCallView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiveCallView()
    }
}

//navigation structure
//show recording options 1.
//ring and receiving a call view 2.
//aceept call and show calling session view 3.
//end call returns to recording options screen
