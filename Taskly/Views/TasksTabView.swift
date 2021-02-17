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
                    .navigationBarTitle("Today's schedule")
            }
            .navigationBarColor(backgroundColor: UIColor(red: 240/255, green: 190/255, blue: 70/255, alpha: 1.0), tintColor: .black)
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
