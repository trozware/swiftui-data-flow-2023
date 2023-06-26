//
//  PizzaNamePicker.swift
//  DataFlow2023
//
//  Created by Sarah Reichelt in June 2023.
//

import SwiftUI

struct PizzaNamePicker: View {
  // A single property of the Pizza struct is passed hare.
  // It's a Binding so data flows 2 ways.
  @Binding var selectedPizzaName: PizzaName

  var body: some View {
    Section(header: Text("Select your pizza:").font(.headline)) {
      List(PizzaName.allCases, id: \.self) { pizzaName in
        Button(action: {
          selectedPizzaName = pizzaName
        }, label: {
          PizzaNamePickerRow(
            selectedPizzaName: selectedPizzaName,
            pizzaName: pizzaName
          )
        })
        .buttonStyle(.plain)
      }
    }
  }
}

#Preview {
  PizzaNamePicker(selectedPizzaName: .constant(.pepperoni))
}

struct PizzaNamePickerRow: View {
  // sub-subview for the pizza name row
  // gets a property for the name & selection to display
  // no binding needed here

  let selectedPizzaName: PizzaName
  let pizzaName: PizzaName

  var body: some View {
    HStack {
      Text(pizzaName.rawValue.capitalized)
      Spacer()
      if pizzaName == selectedPizzaName {
        Image(systemName: "checkmark")
      }
    }
    .contentShape(Rectangle())
    .foregroundColor(.primary)
  }
}
