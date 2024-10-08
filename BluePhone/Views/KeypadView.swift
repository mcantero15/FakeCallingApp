//
//  KeypadView.swift
//  BluePhone
//
//  Created by Mariana Cantero on 11/27/23.
//

import SwiftUI

struct KeypadView: View {
    //@Environment(\.action) var action //access the environment value, in this case var action(from extension EnvironmentValues)
    @State var input: String = ""
    
    var body: some View {
        
        VStack(){
                Spacer()
//                TextField("", text: $input).textFieldStyle(.plain)
            Text(input).font(.largeTitle).frame(height: 50)
                
                Grid{
                        PhoneGridRow(labels: ["1", "2", "3"])
                        PhoneGridRow(labels: ["4", "5", "6"])
                        PhoneGridRow(labels: ["7", "8", "9"])
                        PhoneGridRow(labels: ["*", "0", "#"])
                }.environment(\.action, numberPadAction(_:)).padding(.top, 40.0)
            HStack() {
                Spacer()
                Spacer()
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
                }).padding(.leading, 30.0)
                
                Button(action: {
                    //delete button
                    if !input.isEmpty
                    {
                        input.removeLast()
                    }
                }, label: {
                    Text(verbatim: "\u{232B}")
                        .foregroundStyle(Color(UIColor.black)).font(.largeTitle)
                }).padding()
                Spacer()
            }
            Spacer()
                
        }.padding()
        
        
    }
    
    func numberPadAction(_ key: String){
        input += key
    }

}



struct KeypadView_Previews: PreviewProvider {

    static var previews: some View {
        TabView {
            KeypadView(input: "856")
        }
    }
}
