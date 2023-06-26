//
//  PizzaView.swift
//  DataFlow2023
//
//  Created by Sarah Reichelt in June 2023.
//

import SwiftUI

struct PizzaView: View {
  // Using @State for a struct
  @State private var pizza = Pizza()

  var body: some View {
    VStack {
      Form {
        // Using 2-way binding but each component
        // only needs 1 property from the struct
        PizzaNamePicker(selectedPizzaName: $pizza.name)
        PizzaSizePicker(selectedPizzaSize: $pizza.size)
        PizzaCrustPicker(selectedPizzaCrust: $pizza.crust)
      }
      .formStyle(.columns)

      // Text representation to prove that the
      // subviews are modifying the parent struct
      Text(pizza.pizzaSelection)
        .padding()
        .multilineTextAlignment(.center)
    }
    .padding()
    .navigationTitle("Choose Your Pizza")
  }
}

#Preview {
  PizzaView()
}
