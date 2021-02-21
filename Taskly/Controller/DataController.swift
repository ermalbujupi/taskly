//
//  DataController.swift
//  Taskly
//
//  Created by Ermal Bujupaj on 7.2.21.
//

import Foundation

class DataController: ObservableObject {
    
    static var shared = DataController()
    
    @Published var tasks: [TTask] = [test]
    @Published var completedTasks: [TTask] = []
    
    func saveTask(task: TTask) {
        
    }
    
    func completeTask(id: String) {
       
    }
    
    func deleteTask(id: String) {
        
    }
}


var test: TTask = {
    var t = TTask()
    t.title = "Ermal"
    return t
}()
