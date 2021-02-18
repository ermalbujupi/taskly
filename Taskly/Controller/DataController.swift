//
//  DataController.swift
//  Taskly
//
//  Created by Ermal Bujupaj on 7.2.21.
//

import Foundation

class DataController: ObservableObject {
    
    static var shared = DataController()
    
    @Published var tasks: [Task] = [test]
    @Published var completedTasks: [Task] = []
    
    func saveTask(task: Task) {
        if let id = tasks.firstIndex(where: { loopedTask -> Bool in
            return task.id == loopedTask.id
        }) {
            tasks[id] = task
        } else {
            tasks.append(task)
        }
    }
    
    func completeTask(id: String) {
        for task in tasks {
            if task.id == id {
                task.completed = true
                tasks.removeAll(where: { $0.id == task.id })
                completedTasks.append(task)
            }
        }
    }
    
    func deleteTask(id: String) {
        for task in tasks {
            if task.id == id {
                tasks.removeAll(where: { $0.id == task.id })
            }
        }
    }
}


var test: Task = {
    var t = Task()
    t.title = "Ermal"
    return t
}()
