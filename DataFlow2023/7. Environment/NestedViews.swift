//
//  NestedViews.swift
//  DataFlow2023
//
//  Created by Sarah Reichelt in June 2023.
//

import SwiftUI

struct NestedViews: View {
  // The injected environment property is accessed by type and assigned a name
  @Environment(UserSettings.self) private var userSettings

  var body: some View {
    ZStack {
      Color.yellow.edgesIgnoringSafeArea(.all)

      VStack {
        Text(userSettings.isLoggedIn
             ? "User Logged In"
             : "User Logged Out")
        .padding()
        .font(.title)

        // Button toggles value in environment object
        Button(action: { userSettings.isLoggedIn.toggle() }) {
          Text(userSettings.isLoggedIn ? "Log Out" : "Log In")
            .padding()
        }
        .padding()

        Spacer()

        // display first nested view which is not passed any data
        ChildView()
      }
      .navigationTitle("Environment")
    }
  }
}

#Preview {
  // The environment object must be injected into the preview too.
  NestedViews()
    .environment(UserSettings())
}
