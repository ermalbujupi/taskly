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
    @State var category = ""
    
    let onComplete: (String, String, Date, String) -> Void
    
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
                Section {
                    Text("Category")
                    Spacer()
                    let symbols = ["house.fill", "desktopcomputer", "cart.fill", "bicycle", "car.fill", "pills.fill"]
                    let threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

                    ScrollView(.vertical) {
                        LazyVGrid(columns: threeColumnGrid) {
                            ForEach(0..<6) { idx in
                                Image(systemName: symbols[idx % symbols.count])
                                    .font(.system(size: 30))
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(10)
                                    .padding(10.0)
                                    .border(Color.gray, width: 1.0)
                                    .onTapGesture {
                                        category = symbols[idx]
                                    }
                            }
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                }
                .navigationTitle("New Task")
                .navigationBarItems(trailing:
                                        Button(action: {
                                            onComplete(
                                                title.isEmpty ? "Task" : title,
                                                notes.isEmpty ? "Task notes" : notes,
                                                date,
                                                category
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
