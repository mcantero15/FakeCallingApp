//
//  OptionListRow.swift
//  BluePhone
//
//  Created by Mariana Cantero on 11/28/23.
//

import SwiftUI

struct OptionListRowView: View {
    
    var option: CallOptionModel
    
    var body: some View {
        HStack {
            VStack {
                Text(option.name)
                    .bold()
                
                Text(option.duration)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text(option.day)
                .foregroundColor(.gray)
            
            Image(systemName: option.icon)
                .foregroundColor(.blue)
            
        }
    }
}

struct OptionListRow_Previews: PreviewProvider {
    static var previews: some View {
        OptionListRowView(option: CallOptionModel(name: "Recording 1", duration: "0:00", day: "Today"))
    }
}
