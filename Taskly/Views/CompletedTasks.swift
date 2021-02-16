//
//  CompletedTasks.swift
//  Taskly
//
//  Created by Ermal Bujupaj on 16.2.21.
//

import SwiftUI

struct CompletedTasks: View {

    @ObservedObject var data = DataController.shared

    var body: some View {
        List {
            ForEach(data.completedTasks) { task in
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
