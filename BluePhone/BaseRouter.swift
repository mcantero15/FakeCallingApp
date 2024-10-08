//
//  BaseRouter.swift
//  BluePhone
//
//  Created by Mariana Cantero on 6/6/24.
//

import Foundation
import SwiftUI

@Observable class BaseRouter {
    var path = NavigationPath()
    var isEmpty: Bool {
        return path.isEmpty
    }
    
    func navigateBack() {
        guard !isEmpty else {
            return
        }
        
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
}
