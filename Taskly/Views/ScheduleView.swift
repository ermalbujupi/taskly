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
                Text("You have \(data.tasks.count) tasks.")
                    .font(.title2)
                    .padding(.top, 20.0)
                    .padding(.leading, 20.0)
                Spacer()
            }
            VStack {
                ForEach(data.tasks) { task in
                    NavigationLink(
                        destination: NewTaskView(showingActionSheet: false, task: task, presentationMode: Environment(\.presentationMode)),
                        label: {
                            TaskCell(task: task)
                                .padding()
                        })
                }
            }
            .navigationBarItems(trailing: Button(action: {
                showingCreateTaskSheet = true
            }) {
                Text("Add")
            }
            .sheet(isPresented: $showingCreateTaskSheet) {
                NavigationView {
                    NewTaskView()
                        .navigationTitle("New Task")
                }
            })
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
