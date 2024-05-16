//
//  PhoneGridRow.swift
//  BluePhone
//
//  Created by Mariana Cantero on 11/28/23.
//

import SwiftUI

struct PhoneGridRow: View {
    var labels = ["", "", ""]
    var body: some View {
        
        HStack(spacing: 10) {
            ForEach(0..<3) { index in
                NumberButton(number: labels[index])
            }
        }
        
    }
}

struct PhoneGridRow_Previews: PreviewProvider {
    static var previews: some View {
        PhoneGridRow(labels: ["1", "2", "3"])
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
