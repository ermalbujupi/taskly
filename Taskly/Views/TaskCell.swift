//
//  HomeView.swift
//  Taskly
//
//  Created by Ermal Bujupaj on 6.2.21.
//

import SwiftUI
import SwiftDate

struct TaskCell: View {
    
    let task: Task
    
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
            VStack {
                HStack() {
                    Text(task.title ?? "No Title")
                        .foregroundColor(.black)
                        .bold()
                        .padding(.leading, 20.0)
                        .font(.title2)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                    Image(systemName: "bell.fill")
                        .padding(.top, 5.0)
                        .foregroundColor(.black)
                    if let date = task.date {
                        if date.isToday {
                            Text(Self.hourFormat.string(from: date))
                                .foregroundColor(.black)
                                .padding(.trailing, 20.0)
                        } else if date.isTomorrow {
                            Text("Tomorrow \(Self.hourFormat.string(from: date))")
                                .foregroundColor(.black)
                                .padding(.trailing, 10.0)
                        } else if date.isInPast {
                            Text(Self.taskDateFormat.string(from: date))
                                .foregroundColor(.red)
                                .padding(.trailing, 20.0)
                        } else {
                            Text(Self.taskDateFormat.string(from: date))
                                .foregroundColor(.black)
                                .padding(.trailing, 20.0)
                                
                        }
                    }
                }
                
                HStack {
                    Text(task.notes ?? "")
                        .foregroundColor(.black)
                        .padding(.top, 10.0)
                        .padding(.leading, 20.0)
                        .padding(.bottom, 5.0)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
                HStack {
                    Spacer()
                    if task.completed {
                        Text("Completed")
                            .bold()
                            .foregroundColor(.blue)
                            .padding(.trailing, 20.0)
                            .padding(.bottom, 5.0)
                    }
                    if task.date!.isInPast && !task.completed {
                        Text("Task Overdue")
                            .bold()
                            .foregroundColor(.red)
                            .padding(.trailing, 20.0)
                    }
                }
            }
        }
        .border(Color.gray, width: 1.0)
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(task: Task()).previewLayout(.sizeThatFits)
    }
}
