//
//  DataLink.swift
//  DataFlow2023
//
//  Created by Sarah Reichelt in June 2023.
//

import SwiftUI

struct DataLink: Identifiable {
  let id: Int
  let title: String

  // Static function to return the view to display for any selection
  // The 'default' case handles no selection.
  // Using @ViewBuider means that they don't have to be AnyViews
  // Option 7 has an environment modifier.
  @ViewBuilder
  static func viewToShow(for id: Int?) -> some View {
    switch id {
    case 1:
      Property()
    case 2:
      UsingState()
    case 3:
      Numbers()
    case 4:
      PizzaView()
    case 5:
      ColorSetView()
    case 6:
      PersonListView()
    case 7:
      NestedViews()
        .environment(UserSettings())
    default:
      Text("Select a data flow type from the list.")
    }
  }
}

extension DataLink {
  // Static data for display defining the 7 options.
  static var dataLinks = [
    DataLink(id: 1, title: "Property"),
    DataLink(id: 2, title: "State"),
    DataLink(id: 3, title: "Binding 1"),
    DataLink(id: 4, title: "Binding 2"),
    DataLink(id: 5, title: "Observable 1"),
    DataLink(id: 6, title: "Observable 2"),
    DataLink(id: 7, title: "Environment")
  ]
}
