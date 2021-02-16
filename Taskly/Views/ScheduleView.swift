//
//  ScheduleVIew.swift
//  Taskly
//
//  Created by Ermal Bujupaj on 6.2.21.
//

import SwiftUI

struct ScheduleView: View {
    
    @ObservedObject var data = DataController.shared
    @State var showingCreateTaskSheet = false
    @State var completed = false
    
    var body: some View {
        
        List {
            ForEach(data.tasks) { task in
                TaskCell(task: task)
                    .onTapGesture {
                        data.completeTask(id: task.id)
                    }
            }
        }
        .navigationBarItems(trailing: Button(action: {
            showingCreateTaskSheet = true
        }) {
            Text("Add")
                .foregroundColor(Color.orange.opacity(0.8))
        }
        .sheet(isPresented: $showingCreateTaskSheet) {
            NewTaskView()
        })
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
