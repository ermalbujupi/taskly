//
//  TabView.swift
//  Taskly
//
//  Created by Ermal Bujupaj on 7.2.21.
//

import SwiftUI

struct TasksTabView: View {
    var body: some View {
        TabView {
            NavigationView {
                ScheduleView()
                    .navigationBarTitle("Schedule")
            }
            .navigationBarColor(backgroundColor: UIColor(red: 9/255, green: 32/255, blue: 165/255, alpha: 0.8), tintColor: .white)
            .tabItem {
                Image(systemName: "calendar")
                Text("Tasks")
            }
            NavigationView {
                CompletedTasks()
                    .navigationTitle("Completed tasks")
            }
            .tabItem {
                Image(systemName: "largecircle.fill.circle")
                Text("Completed")
            }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TasksTabView()
    }
}
