//
//  Task.swift
//  Taskly
//
//  Created by Ermal Bujupaj on 7.2.21.
//

import Foundation

class Task: ObservableObject, Identifiable {
    
    var id = UUID().uuidString
    @Published var title = ""
    @Published var time = Date()
    @Published var note = ""
    
    init () {}
    
    public func hour() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: time)
    }
}
