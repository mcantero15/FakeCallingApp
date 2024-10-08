//
//  MakeCallRouter.swift
//  BluePhone
//
//  Created by Mariana Cantero on 6/12/24.
//

import Foundation
import SwiftUI
final class MakeCallRouter: ObservableObject {
    public enum Destination: Codable, Hashable {
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
