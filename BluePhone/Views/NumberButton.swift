//
//  NumberButton.swift
//  BluePhone
//
//  Created by Mariana Cantero on 11/28/23.
//

import SwiftUI

struct NumberButton: View {
    var number: String
    
    var body: some View {
        Button {
        
        } label: {
            ZStack {
                Circle()
                    .fill(Color(hue: 1.0, saturation: 0.997, brightness: 0.001, opacity: 0.133))
                
                Text(number)
                    .font(.title)
            }
        }
        .accentColor(.black)
    }
}

struct NumberButton_Previews: PreviewProvider {
    static var previews: some View {
        NumberButton(number: "1")
            .previewLayout(.fixed(width: 100, height: 100))
    }
}
