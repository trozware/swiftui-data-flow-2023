//
//  NumberChooser.swift
//  DataFlow2023
//
//  Created by Sarah Reichelt in June 2023.
//

import SwiftUI

struct NumberChooser: View {
  // Using value from parent with 2-way binding
  @Binding var stepperValue: Int

  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 15)
        .fill(Color.secondary.opacity(0.1))
        .frame(height: 300)

      VStack {
        // Using bound state from parent with 2-way binding
        Stepper(value: $stepperValue, in: 0...20) {
          Text("Value in child = \(stepperValue)")
        }
        .padding(50)

        // Using bound state from parent as property
        // this view cannot change the value
        NumberBlock(stepperValue: stepperValue)
      }
    }
    .padding()
    .navigationTitle("Binding")
  }
}

#Preview {
  NumberChooser(stepperValue: .constant(3))
}
