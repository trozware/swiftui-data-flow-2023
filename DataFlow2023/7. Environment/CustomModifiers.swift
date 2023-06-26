//
//  CustomModifiers.swift
//  DataFlow2023
//
//  Created by Sarah Reichelt in June 2023.
//

import SwiftUI

// A custom view modifier so all the buttons can look the same
// without having to enter this amount of detail every time
struct GrayButtonStyle: ViewModifier {
  func body(content: Content) -> some View {
    return content
      .frame(width: 150, height: 40)
      .padding()
      .font(.title)
      .background(Color.gray)
      .foregroundColor(.white)
      .cornerRadius(20)
      .buttonStyle(.borderless)
  }
}

// Using a View extension to return this view modifier
// allows it be be used like the standard modifiers
extension View {
  func grayButtonStyle() -> some View {
    modifier(GrayButtonStyle())
  }
}
