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

      ],
      predicate: NSPredicate(format: "completed == false")

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
        GeometryReader { g in
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
                List {
                    ForEach(tasks, id: \.title) {
                        TaskCell(task: $0)
                    }
                    .onDelete(perform: deleteTask(at:))
                }
                .frame(width: g.size.width, height: g.size.height, alignment: .leading)
                .navigationBarItems(trailing: Button(action: {
                    showingCreateTaskSheet = true
                }) {
                    Text("Add")
                }
                .sheet(isPresented: $showingCreateTaskSheet) {
                    NewTaskView { title, notes, date, category in
                        self.addTask(title: title, notes: notes, date: date, category: category)
                        self.showingCreateTaskSheet = false
                    }
                })
            }
        }
    }
    
    func addTask(title: String, notes: String, date: Date, category: String) {
      
        let newTask = Task(context: managedObjectContext)

        newTask.title = title
        newTask.notes = notes
        newTask.date = date
        newTask.category = category
        newTask.completed = false

        saveContext()
    }
    
    func deleteTask(at offsets: IndexSet) {
        offsets.forEach { index in
            let task = self.tasks[index]
            self.managedObjectContext.delete(task)
        }
        
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
