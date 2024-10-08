//
//  EmergencyContactModel.swift
//  BluePhone
//
//  Created by Mariana Cantero on 7/13/24.
//

import Foundation

struct EmergencyContactModel: Identifiable, Codable, Hashable {
    var id: UUID = UUID()
    
    var emergencyContact: String
}
