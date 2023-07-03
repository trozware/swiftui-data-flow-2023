//
//  ContentView.swift
//  DataFlow2023
//
//  Created by Sarah Reichelt in June 2023.
//

import SwiftUI

struct ContentView: View {
  @State private var selectedDataLinkId: Int?

  var body: some View {
    NavigationSplitView {
      SidebarView(selectedDataLinkId: $selectedDataLinkId)
    } detail: {
      DataLink.viewToShow(for: selectedDataLinkId)
    }
  }
}

#Preview {
  ContentView()
}
