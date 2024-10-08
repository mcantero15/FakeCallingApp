//
//  OptionListRow.swift
//  BluePhone
//
//  Created by Mariana Cantero on 11/28/23.
//

import SwiftUI

struct OptionListRowView: View {
    
    var option: CallOptionModel
    var phoneSymbol: String
    
    
    var body: some View {
        HStack {
            Image(systemName: phoneSymbol)
                .foregroundColor(Color(UIColor.systemGray4))
                .padding(.bottom)
                .padding(.trailing, 5.0)
                .font(.caption)
                
            VStack(alignment: .leading) {
                Text(option.name)
                    .bold()
                
                Text(option.callerName)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text(option.duration)
                .foregroundColor(.gray)
            
            Image(systemName: option.icon)
                .foregroundColor(.blue)
            
        }
    }
}

struct OptionListRow_Previews: PreviewProvider {
    static var previews: some View {
        OptionListRowView(option: CallOptionModel(type: "Outgoing", name: "Ask for a ride", fileName: "Recording 1", duration: "0:00", callerName: "Amy"), phoneSymbol: "phone.arrow.up.right.fill")
    }
}
