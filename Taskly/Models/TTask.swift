//
//  Task.swift
//  Taskly
//
//  Created by Ermal Bujupaj on 7.2.21.
//

import Foundation
import SwiftUI

class TTask: ObservableObject, Identifiable {
    
    var id = UUID().uuidString
    @Published var title = ""
    @Published var time = Date()
    @Published var note = ""
    @Published var completed = false
    @Published var color = Color.blue.opacity(0.4)
    
    init () {}
    
    public func hour() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: time)
    }
    
    public func taskOverDue(task: TTask) -> Bool{
        if task.time.isBeforeDate(Date(), granularity: .minute) {
            return true
        }
        return false
    }
}