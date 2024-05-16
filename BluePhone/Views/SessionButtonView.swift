//
//  SessionButtonView.swift
//  BluePhone
//
//  Created by Mariana Cantero on 3/7/24.
//

import SwiftUI

struct SessionButtonView: View {
    var caption : String
    var symbol : String
    var buttonColor: UIColor
    
    var body: some View {
//        Button {
//            
//        } label: {
            VStack {
                ZStack {
                    Circle()
                        .fill(Color(buttonColor))
                        .frame(width: 80, height: 80)
                    Image(systemName: symbol)
                        .font(.title)
                        .foregroundColor(.white)
                }
                Text(caption)
                    .foregroundStyle(Color(UIColor.white))
            }
            
//        }
//        .accentColor(.white)
    }
}

#Preview {
    SessionButtonView(caption: "Speaker", symbol: "speaker.wave.3.fill",buttonColor:.systemGray2)
}
