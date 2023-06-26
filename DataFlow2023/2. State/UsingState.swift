//
//  UsingState.swift
//  DataFlow2023
//
//  Created by Sarah Reichelt in June 2023.
//

import SwiftUI

struct UsingState: View {
  // Using @State as this view owns and can mutate the property
  @State private var counter = 0

  var body: some View {
    // Displaying and editing @State property
    VStack {
      Text("Counter = \(counter)")

      HStack {
        Button(action: {
          counter -= 1
        }, label: {
          Image(systemName: "minus.circle")
            .font(.largeTitle)
            .padding(4)
        })

        Button(action: {
          counter += 1
        }, label: {
          Image(systemName: "plus.circle")
            .font(.largeTitle)
            .padding(4)
        })
      }
    }
    .frame(minWidth: 150, minHeight: 100)
    .buttonStyle(.borderless)
    .navigationTitle("State")
  }
}

#Preview {
  UsingState()
}
