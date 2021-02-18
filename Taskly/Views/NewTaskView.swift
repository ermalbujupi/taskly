//
//  NewTaskView.swift
//  Taskly
//
//  Created by Ermal Bujupaj on 7.2.21.
//

import SwiftUI

struct NewTaskView: View {
    
    @State var showingActionSheet = false
    
    @StateObject var task = Task()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Title")
                    TextField("Wake Up!", text: $task.title)
                }
                Section {
                    Text("Date")
                    DatePicker("Date", selection: $task.time, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
                Section {
                    Text("Notes")
                    TextField("Notes", text: $task.note)
                }
                Section {
                    Text("Color")
                    ColorPicker("Color picker", selection: $task.color)
                }
            }
            .navigationTitle("New Task")
            .navigationBarItems(trailing:
                Button(action: {
                    DataController.shared.saveTask(task: task)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                }
            )
            
        }
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView()
    }
}
