//
//  PersonListModel.swift
//  DataFlow2023
//
//  Created by Sarah Reichelt in June 2023.
//

import Foundation
import Observation

@Observable class PersonListModel {
  // Main list view model
  // Observable so that updates are detected

  var persons: [Person] = []

  func refreshData() {
    if let newPersons = try? readData() {
      persons = newPersons
    }
  }

  func readData() throws -> [Person] {
    guard let fileURL = Bundle.main.url(forResource: "people", withExtension: "json") else {
      throw ReadError.badURL
    }

    do {
      let fileContents = try Data(contentsOf: fileURL)
      let persons = try JSONDecoder().decode([Person].self, from: fileContents)
      return persons.sorted(using: KeyPathComparator(\.lastName))
    } catch {
      // TODO: return some other data
      print(error)
      throw ReadError.badJSON
    }
  }
}

// Possible errors for read
enum ReadError: Error {
  case badURL
  case badJSON
}
