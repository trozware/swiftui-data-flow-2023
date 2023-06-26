//
//  NumberBlock.swift
//  DataFlow2023
//
//  Created by Sarah Reichelt in June 2023.
//

import SwiftUI

struct NumberBlock: View {
  // As this view never changes the value, there is no need to bind it
  var stepperValue: Int

  var body: some View {
    Image(systemName: "\(stepperValue).square")
      .font(.system(size: 100))
      .foregroundColor(.blue)
      .padding(.bottom, 20)
  }
}

#Preview {
  NumberBlock(stepperValue: 7)
}
