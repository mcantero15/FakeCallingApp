//
//  CallOptionViewModel.swift
//  BluePhone
//
//  Created by Mariana Cantero on 3/7/24.
//

import Foundation

class CallOptionViewModel: ObservableObject {
    
    @Published var callOptions: [CallOptionModel] = [
        CallOptionModel(name: "Recording 1", duration: "0:00", callerName: "Amy"),
        CallOptionModel(name: "Recording 2", duration: "0:00", callerName: "Andrew")
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
