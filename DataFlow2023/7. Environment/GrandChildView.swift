//
//  GrandChildView.swift
//  DataFlow2023
//
//  Created by Sarah Reichelt in June 2023.
//

import SwiftUI

struct GrandChildView: View {
  // The injected environment property is accessed again here
  // This is the same property as used in NestedViews
  @Environment(UserSettings.self) var userSettings

  var body: some View {
    // This grandchild view now gets access to the environment object
    // even though its parent does not.

    // An @Environment property cannot be used as a Binding to a control like a Toggle
    // This extra internal property makes that work.
    @Bindable var userSettingsBindable = userSettings

    let imageName = userSettings.isLoggedIn
    ? "person.crop.square"
    : "questionmark.square"

    let buttonText = userSettings.isLoggedIn
    ? "Log Out"
    : "Log In"

    let toggleText = userSettings.isLoggedIn
    ? "User is logged out"
    : "User is logged in"

    // because there is more than one statement in the body method
    // the return keyword is needed to return the View
    ZStack {
      Color.blue

      VStack {
        Image(systemName: imageName).padding()
          .foregroundStyle(Color.white)
          .font(.system(size: 100))

        // Toggling the environment object value changes
        // all the views that use it
        Button(action: { userSettings.isLoggedIn.toggle() }) {
          Text(buttonText)
            .padding()
        }

        Toggle(isOn: $userSettingsBindable.isLoggedIn, label: {
          Text(toggleText)
        })
      }
      .padding()
    }
  }
}

#Preview {
  // The environment object must be injected into the preview too.
  GrandChildView()
    .environment(UserSettings())
}
