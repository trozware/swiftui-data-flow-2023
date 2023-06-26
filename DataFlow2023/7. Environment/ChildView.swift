//
//  ChildView.swift
//  DataFlow2023
//
//  Created by Sarah Reichelt in June 2023.
//

import SwiftUI

struct ChildView: View {
  var body: some View {
    // Because this view does not use the data, there is no need to pass
    // it down to it, but its child can still access that data.
    ZStack {
      Color.green

      VStack {
        Text("This view has no data.")
        Text("But it has a child that does.")

        GrandChildView()
          .padding()
      }
      .foregroundColor(.white)
      .padding()
    }
  }
}

#Preview {
  // Even though this object doesn't use the environment object
  // the preview needs it because its child needs it.
  ChildView()
    .environment(UserSettings())
}
