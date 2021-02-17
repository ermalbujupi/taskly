//
//  Task.swift
//  Taskly
//
//  Created by Ermal Bujupaj on 7.2.21.
//

import Foundation
import SwiftUI

class Task: ObservableObject, Identifiable {
    
    var id = UUID().uuidString
    @Published var title = ""
    @Published var time = Date()
    @Published var note = ""
    @Published var completed = false
    @Published var priority = "None"
    
    init () {}
    
    public func hour() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: time)
    }
    
    public func colorForPriority(priority: String) -> Color {
        switch priority {
        case "Low":
            return Color.green
        case "Medium":
            return Color.blue
        case "High":
            return Color.red
        default:
            return Color.blue
        }
    }
}