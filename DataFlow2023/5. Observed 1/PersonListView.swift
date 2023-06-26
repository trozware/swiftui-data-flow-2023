//
//  PersonListView.swift
//  DataFlow2023
//
//  Created by Sarah Reichelt in June 2023.
//

import SwiftUI

struct PersonListView: View {
  // Using an Observable for reference-based data (classes)
  @State private var personList = PersonListModel()
  @State private var selectedPerson: Person?
  @State private var shouldShowInspector = false

  var body: some View {
    List(selection: $selectedPerson) {
      ForEach($personList.persons) { $person in
        Text(person.name)
          .tag(person)
      }
    }
    .inspector(isPresented: $shouldShowInspector) {
      if let selectedPerson {
        PersonEditView(person: selectedPerson)
      } else {
        Text("Select a person from the list.")
      }
    }
    .navigationTitle("People")

    // This runs whenever the view appears to load the initial data
    .onAppear {
      personList.refreshData()
    }

    // This detects a selection
    //   and sets the Boolean that toggles the inspector.
    .onChange(of: selectedPerson, { oldValue, newValue in
      shouldShowInspector = newValue != nil
    })
  }
}

#Preview {
  NavigationStack {
    PersonListView()
  }
}
