//
//  ScheduleVIew.swift
//  Taskly
//
//  Created by Ermal Bujupaj on 6.2.21.
//

import SwiftUI

struct ScheduleView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
      entity: Task.entity(),
      sortDescriptors: [
//        NSSortDescriptor(keyPath: \, ascending: true)
      ]

    ) var tasks: FetchedResults<Task>
    
    @ObservedObject var data = DataController.shared
    @State var showingCreateTaskSheet = false
    @State var completed = false
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var body: some View {
        ScrollView {
            HStack {
                Text("\(Date(), formatter: Self.taskDateFormat)")
                    .font(.title2)
                    .bold()
                    .padding(.top, 20.0)
                    .padding(.leading, 20.0)
                Spacer()
            }
            HStack {
                Text("You have \(tasks.count) tasks.")
                    .font(.title2)
                    .padding(.top, 20.0)
                    .padding(.leading, 20.0)
                Spacer()
            }
            VStack {
                ForEach(tasks, id: \.title) {
                    TaskCell(task: $0)
                        .padding(.leading, 20.0)
                        .padding(.trailing, 20.0)
                }
            }
            .navigationBarItems(trailing: Button(action: {
                showingCreateTaskSheet = true
            }) {
                Text("Add")
            }
            .sheet(isPresented: $showingCreateTaskSheet) {
                NewTaskView { title, notes, date in
                    self.addTask(title: title, notes: notes, date: date)
                    self.showingCreateTaskSheet = false
                }
            })
        }
    }
    
    func addTask(title: String, notes: String, date: Date) {
      
        let newTask = Task(context: managedObjectContext)

        newTask.title = title
        newTask.notes = notes
        newTask.date = date

        saveContext()
    }
    
    func saveContext() {
      do {
        try managedObjectContext.save()
      } catch {
        print("Error saving managed object context: \(error)")
      }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
