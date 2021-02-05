//
//  LogInScreen.swift
//  Taskly
//
//  Created by Ermal Bujupaj on 5.2.21.
//

import SwiftUI

struct LogInScreen: View {
    var body: some View {
        VStack(spacing: 10) {
            VStack {
                Text("Plan tasks easily!").font(.title).fontWeight(.bold).padding(.leading, -150)
                Text("Planning the daily work, \nit has never ben so impacting").font(.title3).padding(.leading, -120)
            }
            Spacer()
            Button(action: {
                
            }) {
                Text("Start")
                    .font(.title)
                    .padding()
                    .frame(width: 300)
                    .background(Color.orange.opacity(0.8))
                    .cornerRadius(20.0)
                    .foregroundColor(.black)
            }
            
            Text("Do you have an account?")
            Button(action: {
                
            }) {
                Text("Log In")
                    .foregroundColor(Color.orange.opacity(0.8))
            }
            Spacer()
            Spacer()
        }
    }
}

struct LogInScreen_Previews: PreviewProvider {
    static var previews: some View {
        LogInScreen()
    }
}
