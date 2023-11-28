//
//  ClockView.swift
//  BluePhone
//
//  Created by Mariana Cantero on 11/27/23.
//

import SwiftUI

struct ClockView: View {
    
    var callOptions: [CallOption] = [CallOption(name: "Recording 1", duration: "0:00", day: "Today"),
                                     CallOption(name: "Recording 2", duration: "0:00", day: "Today"),
                                     CallOption(name: "Recording 3", duration: "0:00", day: "Today"),
                                     CallOption(name: "Recording 4", duration: "0:00", day: "Today"),
                                     CallOption(name: "Recording 5", duration: "0:00", day: "Today"),
                                     CallOption(name: "Recording 6", duration: "0:00", day: "Today"),
                                     CallOption(name: "Recording 7", duration: "0:00", day: "Today"),
                                     CallOption(name: "Recording 8", duration: "0:00", day: "Today"),
                                     CallOption(name: "Recording 9", duration: "0:00", day: "Today") ]
    
    
    var body: some View {
        
        List(callOptions) { option in
            
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
        .listStyle(.plain)
        
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}
