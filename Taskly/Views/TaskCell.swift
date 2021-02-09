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
        VStack {
            HStack() {
                Image(systemName: "largecircle.fill.circle")
                    .resizable()
                    .frame(width: 32.0, height: 32.0)
                    .padding(15)
                    .cornerRadius(10.0)
                    .foregroundColor(task.colorForPriority(priority: task.priority))
                    
                Text($task.title.wrappedValue)
                    .padding()
                    .foregroundColor(.black)
                    .font(.title)
                Spacer()
                Text(task.hour())
                    .padding()
                    .font(.title2)
            }
            .padding(.leading, 15.0)
        }
        .background(Color.gray.opacity(0.3))
        .cornerRadius(20.0)
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(task: Task()).previewLayout(.sizeThatFits)
    }
}
