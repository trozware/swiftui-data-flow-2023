//
//  ColorSet.swift
//  DataFlow2023
//
//  Created by Sarah Reichelt in June 2023.
//

import SwiftUI
import Observation

@Observable class ColorSet {
  // Observable class
  // The 6 color components are not private so any changes
  // get published to the views that are observing

  var foregroundRed = 0.0
  var foregroundGreen = 0.0
  var foregroundBlue = 0.0

  var backgroundRed = 1.0
  var backgroundGreen = 1.0
  var backgroundBlue = 1.0

  // Computed variables to create the RGB colors from the components
  var foregroundColor: Color {
    return Color(red: foregroundRed, green: foregroundGreen, blue: foregroundBlue)
  }

  var backgroundColor: Color {
    return Color(red: backgroundRed, green: backgroundGreen, blue: backgroundBlue)
  }
}
