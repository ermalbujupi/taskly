//
//  DataController.swift
//  Taskly
//
//  Created by Ermal Bujupaj on 7.2.21.
//

import Foundation

class DataController: ObservableObject {
    
    static var shared = DataController()
    
    @Published var tasks: [Task] = [testTask1, testTask2]
    @Published var completedTasks: [Task] = []
    
    func saveTask(task: Task) {
        tasks.append(task)
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
}
