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
        Text("ID")
        Spacer()
        Text("\(person.id)")
      }

      TextField("Name", text: $person.name)
      TextField("Phone", text: $person.phone)

      Section("Address") {
        TextField("Suite", text: $person.suite)
        TextField("Street", text: $person.street)
        TextField("City", text: $person.city)
        TextField("Zip", text: $person.zipcode)
      }
    }
    .textFieldStyle(.squareBorder)
    .formStyle(.grouped)
    .frame(width: 300)
  }
}

#Preview {
  PersonEditView(person: Person.samplePerson)
}
