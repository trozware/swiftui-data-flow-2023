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

  var id : String = ""
  var firstName : String = ""
  var lastName : String = ""
  var email : String = ""
  var address1 : String = ""
  var address2 : String = ""
  var city : String = ""
  var state : String = ""
  var postcode : String = ""
  var country : String = ""

  var fullName: String {
    "\(firstName) \(lastName)"
  }

  var displayID: String {
    String(id.suffix(8))
  }

  // Decoding from JSON

  enum CodingKeys: String, CodingKey {
    case id = "id"
    case firstName = "firstName"
    case lastName = "lastName"
    case email = "email"
    case address1 = "address1"
    case address2 = "address2"
    case city = "city"
    case state = "state"
    case postcode = "postcode"
    case country = "country"
  }

  required init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decode(String.self, forKey: .id)
    firstName = try values.decode(String.self, forKey: .firstName)
    lastName = try values.decode(String.self, forKey: .lastName)
    email = try values.decode(String.self, forKey: .email)
    address1 = try values.decode(String.self, forKey: .address1)
    address2 = try values.decode(String.self, forKey: .address2)
    city = try values.decode(String.self, forKey: .city)
    state = try values.decode(String.self, forKey: .state)
    postcode = try values.decode(String.self, forKey: .postcode)
    country = try values.decode(String.self, forKey: .country)
  }

  // To supply sample data to previews
  init() {}

  static var samplePerson: Person {
    let person = Person()

    person.id = "3bfe060c-652f-4d55-bb75-1e5cc1078d9a"
    person.firstName = "Win"
    person.lastName = "Gascoyne"
    person.email = "wgascoyne1w@spiegel.de"
    person.address1 = "7 Dwight Drive"
    person.address2 = "Suite 9"
    person.city = "Muroto-misakicho"
    person.state = ""
    person.postcode = "781-7109"
    person.country = "Japan"

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
