//
//  LogInScreen.swift
//  Taskly
//
//  Created by Ermal Bujupaj on 5.2.21.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            LogInScreen().navigationBarTitle("Taskly")
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
