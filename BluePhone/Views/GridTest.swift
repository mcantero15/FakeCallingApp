//
//  GridTest.swift
//  BluePhone
//
//  Created by Mariana Cantero on 9/29/24.
//

import SwiftUI

struct GridTest: View {
    
    @State var input: String = ""
    
    var body: some View {
        
        VStack {
            
            Spacer()
            Text(input).font(.largeTitle).frame(height: 50)
            
            
            GeometryReader { proxy in
                Grid{
                        PhoneGridRow(labels: ["1", "2", "3"])
                        PhoneGridRow(labels: ["4", "5", "6"])
                        PhoneGridRow(labels: ["7", "8", "9"])
                        PhoneGridRow(labels: ["*", "0", "#"])
                    
                    HStack {
                        Button(action: {
                            //call button with entered number
                            let url = URL(string: "tel:\(input)")
                            if UIApplication.shared.canOpenURL(url!)
                            {
                                UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                            }
                        }, label: {
                            ZStack {
                                Circle().fill(Color(UIColor.blue)).frame(width: 80, height: 80)
                                Image(systemName: "phone.fill")
                                    .foregroundColor(Color.white)
                                    .font(.title)
                            }
                        })
                        
                        
                        Button(action: {
                            //delete button
                            if !input.isEmpty
                            {
                                input.removeLast()
                            }
                        }, label: {
                            Text(verbatim: "\u{232B}")
                                .foregroundStyle(Color(UIColor.black)).font(.largeTitle)
                        })
                        
                        
                    }
                    
                    
                }
                
                
                
                
            }//.padding()
            
            
        }
        
        
        
    }
}

#Preview {
    GridTest()
}
