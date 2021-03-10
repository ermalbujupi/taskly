//
//  NewTaskView.swift
//  Taskly
//
//  Created by Ermal Bujupaj on 7.2.21.
//

import SwiftUI

struct NewTaskView: View {
    
    @State var title = ""
    @State var notes = ""
    @State var date = Calendar.current.date(byAdding: .hour, value: 1, to: Date())!
    
    let onComplete: (String, String, Date) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Title")
                    TextField("Wake Up!", text: $title)
                }
                Section {
                    Text("Date")
                    DatePicker("Date", selection: $date, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
                Section {
                    Text("Notes")
                    TextField("Notes", text: $notes)
                        .disableAutocorrection(true)
                }
                .navigationTitle("New Task")
                .navigationBarItems(trailing:
                                        Button(action: {
                                            onComplete(
                                                title.isEmpty ? "Task" : title,
                                                notes.isEmpty ? "Task notes" : notes,
                                                date
                                            )
                                        }) {
                                            Text("Save")
                                        }
                )
                
            }
            .navigationBarTitle(Text("Add Task"), displayMode: .inline)
        }
    }
}
