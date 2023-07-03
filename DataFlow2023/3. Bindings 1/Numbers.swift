//
//  Numbers.swift
//  DataFlow2023
//
//  Created by Sarah Reichelt in June 2023.
//

import SwiftUI

struct Numbers: View {
  // Using @State as this view owns and can mutate the property
  @State private var stepperValue = 0

  var body: some View {
    VStack {
      // Display @State property
      Text("Parent view value = \(stepperValue)")
        .font(.title)
        .padding()

      // Pass to subview as a Binding ($) for two-way editing
      NumberChooser(stepperValue: $stepperValue)
    }
  }
}

#Preview {
  Numbers()
}
