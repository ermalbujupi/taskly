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
                        .padding(.top, 10.0)
                        .padding(.leading, 30.0)
                        .padding(.bottom, 10.0)
                    Spacer()
                }
            }
        }
        .padding(.top, 10.0)
        .background(task.color)
        .cornerRadius(10.0)
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(task: Task()).previewLayout(.sizeThatFits)
    }
}
