//
//  DataController.swift
//  Taskly
//
//  Created by Ermal Bujupaj on 7.2.21.
//

import Foundation

class DataController: ObservableObject {
    
    static var shared = DataController()
    
    @Published var tasks: [Task] = []
    
    func saveTask(task: Task) {
        tasks.append(task)
        print("task")
    }
}
