//
//  Property.swift
//  DataFlow2023
//
//  Created by Sarah Reichelt in June 2023.
//

import SwiftUI

struct Property: View {
  // Property - no changes
  let greeting = "Hello from SwiftUI!"

  var body: some View {
    // Using property directly
    Text(greeting)
      .font(.title)
      .navigationTitle("Property")
  }
}

#Preview {
  Property()
}
