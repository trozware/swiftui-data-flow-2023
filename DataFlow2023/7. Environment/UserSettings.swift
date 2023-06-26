//
//  UserSettings.swift
//  DataFlow2023
//
//  Created by Sarah Reichelt in June 2023.
//

import Foundation
import Observation

// An Environment class is just like any Observable class

@Observable class UserSettings {
  var isLoggedIn: Bool = false
}
