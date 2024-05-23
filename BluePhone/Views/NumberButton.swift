//
//  NumberButton.swift
//  BluePhone
//
//  Created by Mariana Cantero on 11/28/23.
//

import SwiftUI

struct NumberButton: View {
    @Environment(\.action) var action: (String) -> Void //access the environment value, in this case var action(from extension EnvironmentValues)
    
    var key: String
    var body: some View {
        //when pressed, button will perform the action in the environement with the button's key passed in as the parameter
        Button(action: {self.action(self.key)}, label: {
            ZStack {
                Circle()
                    .fill(Color(hue: 1.0, saturation: 0.997, brightness: 0.001, opacity: 0.133)).frame(width: 90, height: 90)
                
                Text(key)
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
            }
        })
        
        
        
        
    }
}
//creating an Environment Key with a default value we want to pass through, we are passing down a function with a string parameter and returns void
struct NumberButtonKey: EnvironmentKey {
    static var defaultValue: (String) -> Void {{_ in}}
}
//register Environemnt Key in environment values,create an extension on environment values, values are accessed through the @Environment property value
extension EnvironmentValues {
    var action: (String) -> Void {
        get {self[NumberButtonKey.self] }   //getter
        set {self[NumberButtonKey.self] = newValue }    //setter, newValue does not need to be explicity defined
    }
}


struct NumberButton_Previews: PreviewProvider {
    static var previews: some View {
        NumberButton(key: "1")
            .previewLayout(.fixed(width: 100, height: 100))
    }
}
