//
//  AlarmButtonView.swift
//  BluePhone
//
//  Created by Mariana Cantero on 7/2/24.
//

import SwiftUI

struct AlarmButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color("AlarmButton").shadow(.drop(color: .black, radius: 1, x: 0, y: 12)))
                .frame(width: 300, height: 300)
//                .stroke(.gray, lineWidth: 20)
            Text("ALARM").foregroundStyle(Color("AlarmFont")).lineLimit(0).font(.system(size: 50)).bold()
//                .shadow(color: .black, radius: 1, x: 4, y: 5)
        }
    }
}

#Preview {
    AlarmButtonView()
}
