//
//  HomeView.swift
//  Taskly
//
//  Created by Ermal Bujupaj on 6.2.21.
//

import SwiftUI
import SwiftDate

struct TaskCell: View {
    
    @StateObject var task = TTask()
    
    static let hourFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM HH:mm"
        return formatter
    }()
    
    var body: some View {
        HStack {
            Image(task.completed ? "checked_box" : "unchecked_box")
                .frame(width: 40.0, height: 40.0, alignment: .center)
                .padding(.leading, 10.0)
                .onTapGesture {
                    task.completed = true
                }
            NavigationLink(
                destination: NewTaskView(showingActionSheet: false, task: task, presentationMode: Environment(\.presentationMode)),
                label: {
                    VStack {
                        HStack() {
                            Text($task.title.wrappedValue)
                                .foregroundColor(.black)
                                .bold()
                                .padding(.leading, 20.0)
                                .font(.title2)
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                            Image(systemName: "bell.fill")
                                .padding(.top, 5.0)
                                .foregroundColor(.black)
                            if task.time.isToday {
                                Text(Self.hourFormat.string(from: task.time))
                                    .foregroundColor(.black)
                                    .padding(.trailing, 20.0)
                                    .font(.headline)
                            } else if task.time.isTomorrow {
                                Text("Tomorrow \(Self.hourFormat.string(from: task.time))")
                                    .foregroundColor(.black)
                                    .padding(.trailing, 10.0)
                                    .font(.headline)
                            } else if task.taskOverDue(task: task) {
                                Text(Self.taskDateFormat.string(from: task.time))
                                    .foregroundColor(.red)
                                    .padding(.trailing, 20.0)
                                    .font(.headline)
                            } else {
                                Text(Self.taskDateFormat.string(from: task.time))
                                    .foregroundColor(.black)
                                    .padding(.trailing, 20.0)
                                    .font(.headline)
                            }
                        }
                        HStack {
                            Text($task.note.wrappedValue)
                                .foregroundColor(.black)
                                .padding(.top, 10.0)
                                .padding(.leading, 20.0)
                                .padding(.bottom, 5.0)
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            if task.taskOverDue(task: task) && !task.completed {
                                Text("Task Overdue")
                                    .bold()
                                    .foregroundColor(.red)
                                    .padding(.trailing, 20.0)
                            } else if task.completed {
                                Text("Completed")
                                    .bold()
                                    .foregroundColor(.blue)
                                    .padding(.trailing, 20.0)
                                    .padding(.bottom, 5.0)
                            }
                        }
                    }
                })
        }
        .border(Color.gray, width: 1.0)
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(task: TTask()).previewLayout(.sizeThatFits)
    }
}
