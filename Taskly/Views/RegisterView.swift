//
//  RegisterView.swift
//  Taskly
//
//  Created by Ermal Bujupaj on 6.2.21.
//

import SwiftUI

struct RegisterView: View {
    
    @State var name: String
    @State var lastName: String
    @State var username: String
    @State var email: String
    @State var password: String
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("Name")) {
                        TextField("Name", text: $name)
                    }
                    Section(header: Text("Last Name")) {
                        TextField("Last Name", text: $lastName)
                    }
                    Section(header: Text("Username")) {
                        TextField("Username", text: $username)
                    }
                    Section(header: Text("Email")) {
                        TextField("Email", text: $email)
                    }
                    Section(header: Text("Password")) {
                        TextField("Password", text: $password)
                    }
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Spacer()
                            Text("Sign Up")
                            Spacer()
                        }
                    })
                }.listStyle(GroupedListStyle())
            }.navigationTitle("Register")
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(name: "", lastName: "", username: "", email: "", password: "")
    }
}
