//
//  Person.swift
//  DataFlow2023
//
//  Created by Sarah Reichelt in June 2023.
//

import Foundation
import Observation

@Observable class Person: Identifiable, Decodable {
  // Main model for use as Observable
  // Derived from JSON

  // Even though this is not observed directly,
  // it must be an Observable for the data flow to work
  // And each property must have an initial value

  var id: Int = 0
  var name: String = ""
  var phone: String = ""
  var street: String = ""
  var suite: String = ""
  var city: String = ""
  var zipcode: String = ""

  // Decoding from JSON

  required init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decode(Int.self, forKey: .id)
    name = try values.decode(String.self, forKey: .name)
    phone = try values.decode(String.self, forKey: .phone)
    let address = try values.decode(Address.self, forKey: .address)
    suite = address.suite
    city = address.city
    zipcode = address.zipcode
  }

  // The keys used from the JSON
  enum CodingKeys: String, CodingKey {
    case id, name, phone, address
  }

  // Intermediary sub-structure for use when decoding
  struct Address: Codable {
    var street: String = ""
    var suite: String = ""
    var city: String = ""
    var zipcode: String = ""
  }

  // To supply sample data to previews
  init() {}

  static var samplePerson: Person {
    let person = Person()
    person.id = 99
    person.name = "Jane Doe"
    person.phone = "123 456 7890"
    person.street = "Nowhere Road"
    person.suite = "37"
    person.city = "Springfield"
    person.zipcode = "123456"
    return person
  }
}

extension Person: Hashable, Equatable {
  // Both these are needed to allow a Person
  // to be used for the selection in the List
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }

  static func ==(lhs: Person, rhs: Person) -> Bool {
    lhs.id == rhs.id
  }
}
