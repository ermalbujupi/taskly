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
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(data.tasks) { task in
                    TaskCell(task: task)
                }
            }
        }
            .padding()
            .navigationBarItems(trailing:                     Button(action: {
                showingCreateTaskSheet = true
            }) {
            Image(systemName: "plus")
                .foregroundColor(.white)
                .padding()
                .background(Color.orange.opacity(0.8))
                .cornerRadius(10.0)
            }
            .sheet(isPresented: $showingCreateTaskSheet) {
                NewTaskView()
            }
        )
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
