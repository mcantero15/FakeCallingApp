//
//  EndButtonView.swift
//  BluePhone
//
//  Created by Mariana Cantero on 6/12/24.
//

import SwiftUI

struct EndButtonView: View {
    @Environment(\.endAction) var endAction: () -> Void
    
    var body: some View {
        
        
        Button(action: {self.endAction()}, label: {
            VStack {
                        ZStack {
                            Circle()
                                .fill(Color(UIColor.red))
                                .frame(width: 80, height: 80)
                            Image(systemName: "phone.down.fill")
                                .font(.title)
                                .foregroundStyle(Color.white)
                        }
                        Text("End")
                            .foregroundStyle(Color(UIColor.white))
                    }
        })
        
        
        
        
        
        
    }
}

struct EndButtonKey: EnvironmentKey {
    static var defaultValue: () -> Void {{}}
}

extension EnvironmentValues {
    var endAction: () -> Void {
        get{self[EndButtonKey.self]}
        set{self[EndButtonKey.self] = newValue}
    }
}

#Preview {
    EndButtonView()
}
