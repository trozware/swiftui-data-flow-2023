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

  // Data fetched using async methods

  func refreshData() {
    Task {
      if let newPersons = try? await fetchData() {
        persons = newPersons
      }
    }
  }

  func fetchData() async throws -> [Person] {
    let address = "https://jsonplaceholder.typicode.com/users"
    guard let url = URL(string: address) else {
      print("Bad url")
      throw FetchError.badURL
    }
    let request = URLRequest(url: url)

    let (data, response) = try await URLSession.shared.data(for: request)
    guard
      let response = response as? HTTPURLResponse,
      response.statusCode < 400 else {
      print("Bad response")
      throw FetchError.badResponse
    }

    do {
      let persons = try JSONDecoder().decode([Person].self, from: data)
      return persons
    } catch {
      print(error)
      throw FetchError.badJSON
    }
  }
}

// Possible errors for fetch
enum FetchError: Error {
  case badURL
  case badResponse
  case badJSON
}
