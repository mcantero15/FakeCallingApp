//
//  AlarmButtonPressedView.swift
//  BluePhone
//
//  Created by Mariana Cantero on 7/7/24.
//

import SwiftUI

struct AlarmButtonPressedView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color("AlarmButton").shadow(.drop(color: .black, radius: 1, x: 0, y: 0)))
                .frame(width: 300, height: 300)
            Text("ALARM").foregroundStyle(Color("AlarmFont")).lineLimit(0).font(.system(size: 50)).bold()
        }
    }
}

#Preview {
    AlarmButtonPressedView()
}
