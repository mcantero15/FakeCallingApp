//
//  ReceiveCallRouter.swift
//  BluePhone
//
//  Created by Mariana Cantero on 5/30/24.
//

import Foundation
import SwiftUI

final class ReceiveCallRouter: ObservableObject {
    public enum Destination: Codable, Hashable {
        case acceptCall(call: CallOptionModel)
        case callingSession(call: CallOptionModel)
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
