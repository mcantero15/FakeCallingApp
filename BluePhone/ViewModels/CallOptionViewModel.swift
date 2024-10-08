//
//  CallOptionViewModel.swift
//  BluePhone
//
//  Created by Mariana Cantero on 3/7/24.
//

import Foundation

class CallOptionViewModel: ObservableObject {
    
    @Published var callOptions: [CallOptionModel] = [
        CallOptionModel(type: "Outgoing", name: "Ask for a ride", fileName: "OutgoingScript1", duration: "00:48", callerName: "Amy"),
        CallOptionModel(type: "Outgoing", name: "Awaiting your arrival", fileName: "OutgoingScript2", duration: "00:30", callerName: "Amy"),
        CallOptionModel(type: "Incoming", name: "Ask for a ride", fileName: "IncomingScript1", duration: "00:39", callerName: "Amy"),
        CallOptionModel(type: "Incoming", name: "Awaiting your arrival", fileName: "IncomingScript2", duration: "00:21", callerName: "Amy")
    ] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init()
    {
        getItems()
    }
    
    //get the call options to display them to the UI
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([CallOptionModel].self, from: data)
        else {return}
        self.callOptions = savedItems
    }
    
    //move items in the list
    func moveItem(from: IndexSet, to: Int ) {
        callOptions.move(fromOffsets: from, toOffset: to)
    }
    
    //save the call options between sessions
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(callOptions) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    
}
