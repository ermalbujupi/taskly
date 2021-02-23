//
//  CompletedTasks.swift
//  Taskly
//
//  Created by Ermal Bujupaj on 16.2.21.
//

import SwiftUI
import CoreData

struct CompletedTasks: View {

    @FetchRequest(
      entity: Task.entity(),
      sortDescriptors: [
      ],
      predicate: NSPredicate(format: "completed == true")
    ) var completedTasks: FetchedResults<Task>

    var body: some View {
        List {
            ForEach(completedTasks, id: \.title) { task in
                TaskCell(task: task)
            }
        }
    }
}

struct CompletedTasks_Previews: PreviewProvider {
    static var previews: some View {
        CompletedTasks()
    }
}
