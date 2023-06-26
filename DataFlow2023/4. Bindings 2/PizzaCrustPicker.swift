//
//  PizzaCrustPicker.swift
//  DataFlow2023
//
//  Created by Sarah Reichelt in June 2023.
//

import SwiftUI

struct PizzaCrustPicker: View {
  // A single property of the Pizza struct is passed hare.
  // It's a Binding so data flows 2 ways.
  @Binding var selectedPizzaCrust: PizzaCrust

  var body: some View {
    Section(header: Text("Select your crust:").font(.headline)) {
      Picker("", selection: $selectedPizzaCrust) {
        ForEach(PizzaCrust.allCases, id: \.self) { pizzaCrust in
          Text(pizzaCrust.rawValue.capitalized).tag(pizzaCrust)
        }
      }
      .pickerStyle(.segmented)
    }
  }
}

#Preview {
  PizzaCrustPicker(selectedPizzaCrust: .constant(.thin))
}
