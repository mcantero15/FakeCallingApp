//
//  TabReceiveCallRouter.swift
//  BluePhone
//
//  Created by Mariana Cantero on 6/12/24.
//

import Foundation
@Observable class TabReceiveCallRouter: BaseRouter {
    enum TabReceiveCallDestination: Hashable {
        case acceptCall(call: CallOptionModel)
        case callingSession(call:CallOptionModel)
    }
    
    func navigate(to destination: TabReceiveCallDestination) {
        path.append(destination)
    }
}
