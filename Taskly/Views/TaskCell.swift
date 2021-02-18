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
                        .bold()
                        .padding(.leading, 20.0)
                        .font(.title2)
                    Spacer()
                    Image(systemName: "bell.fill")
                    Text(task.hour())
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
        .background(Color.init(UIColor(red: 215/255, green: 216/255, blue: 240/255, alpha: 1/0)))
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
