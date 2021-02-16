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
            if task.completed {
                Image(systemName: "checkmark.circle.fill")
                    .padding()
                    .font(.title)
            } else {
                Image(systemName: "checkmark.circle")
                    .padding()
                    .font(.title)
            }
            VStack {
                HStack() {
                    Text($task.title.wrappedValue)
                        .padding(.leading, 10.0)
                        .font(.title)
                    Spacer()
                    Text(task.hour())
                        .padding()
                        .font(.title2)
                }
                HStack {
                    Text($task.note.wrappedValue)
                        .font(.title3)
                        .padding(.leading, 10.0)
                        .padding(.bottom, 10.0)
                    Spacer()
                }
            }
        }
        .padding(.top, 10.0)
        .background(task.completed ? Color.orange.opacity(0.8) : Color.gray.opacity(0.2))
        .cornerRadius(10.0)
    }
}

public func update() {
    
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(task: testTask2).previewLayout(.sizeThatFits)
    }
}
