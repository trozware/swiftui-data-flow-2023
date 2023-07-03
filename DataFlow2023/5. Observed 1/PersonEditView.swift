//
//  PersonEditView.swift
//  DataFlow2023
//
//  Created by Sarah Reichelt in June 2023.
//

import SwiftUI
import Observation

struct PersonEditView: View {
  @Bindable var person: Person

  var body: some View {
    Form {
      HStack {
        Text("ID:")
        Spacer()
        Text("\(person.displayID)")
      }

      TextField("First Name:", text: $person.firstName)
      TextField("Last Name:", text: $person.lastName)
      TextField("Email:", text: $person.email)

      Section("Address") {
        TextField("Line 1:", text: $person.address1)
        TextField("Line 2:", text: $person.address2)
        TextField("City:", text: $person.city)
        TextField("Street:", text: $person.state)
        TextField("Post Code:", text: $person.postcode)
        TextField("Country:", text: $person.country)
      }
    }
    .textFieldStyle(.squareBorder)
    .formStyle(.grouped)
    .frame(minWidth: 300, minHeight: 400)
  }
}

#Preview {
  PersonEditView(person: Person.samplePerson)
}
