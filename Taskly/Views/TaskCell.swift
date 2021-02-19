//
//  HomeView.swift
//  Taskly
//
//  Created by Ermal Bujupaj on 6.2.21.
//

import SwiftUI

struct TaskCell: View {
    
    @StateObject var task = Task()
    
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
                            Spacer()
                            Image(systemName: "bell.fill")
                                .foregroundColor(.black)
                            Text(task.hour())
                                .foregroundColor(.black)
                                .padding(.trailing, 20.0)
                                .font(.headline)
                        }
                        HStack {
                            Text($task.note.wrappedValue)
                                .foregroundColor(.black)
                                .padding(.top, 10.0)
                                .padding(.leading, 30.0)
                            Spacer()
                        }
                    }
                    .background(task.color)
                    .cornerRadius(10.0)
                })
        }
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(task: Task()).previewLayout(.sizeThatFits)
    }
}
