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

    let imageName = userSettings.isLoggedIn
    ? "person.crop.square"
    : "questionmark.square"

    let buttonText = userSettings.isLoggedIn
    ? "Log Out"
    : "Log In"

    // because there is more than one statement in the body method
    // the return keyword is needed to return the View
    return ZStack {
      Color.blue

      VStack {
        Image(systemName: imageName).padding()

        // Toggling the environment object value changes
        // all the views that use it
        Button(action: { userSettings.isLoggedIn.toggle() }) {
          Text(buttonText)
        }
        .grayButtonStyle()
      }
      .padding()
    }
    .foregroundColor(.white)
    .font(.system(size: 100))
  }
}

#Preview {
  // The environment object must be injected into the preview too.
  GrandChildView()
    .environment(UserSettings())
}
