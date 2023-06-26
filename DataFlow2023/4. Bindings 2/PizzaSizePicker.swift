//
//  PizzaSizePicker.swift
//  DataFlow2023
//
//  Created by Sarah Reichelt in June 2023.
//

import SwiftUI

struct PizzaSizePicker: View {
  // A single property of the Pizza struct is passed hare.
  // It's a Binding so data flows 2 ways.
  @Binding var selectedPizzaSize: PizzaSize

  var body: some View {
    Section(header: Text("Select your size:").font(.headline)) {
      Picker("", selection: $selectedPizzaSize) {
        ForEach(PizzaSize.allCases, id: \.self) { pizzaSize in
          Text(pizzaSize.rawValue.capitalized).tag(pizzaSize)
        }
      }
      .pickerStyle(.segmented)
    }
  }
}

#Preview {
  PizzaSizePicker(selectedPizzaSize: .constant(.large))
}
