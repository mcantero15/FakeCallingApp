//
//  KeypadView.swift
//  BluePhone
//
//  Created by Mariana Cantero on 11/27/23.
//

import SwiftUI

struct KeypadView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                Text("Recording 1")
                    .foregroundColor(.black)
                    .lineLimit(1)
                
                VStack(spacing: 10) {
                    PhoneGridRow(labels: ["1", "2", "3"])
                    PhoneGridRow(labels: ["4", "5", "6"])
                    PhoneGridRow(labels: ["7", "8", "9"])
                    PhoneGridRow(labels: ["*", "0", "#"])
                    
                }
                .background(Color.red).frame(height: geometry.size.height * 0.9)
                .padding()
                
            }.background(Color.green)
        }
    }
}

struct KeypadView_Previews: PreviewProvider {
    static var previews: some View {
        KeypadView()
    }
}
