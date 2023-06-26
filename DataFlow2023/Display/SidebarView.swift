//
//  SidebarView.swift
//  DataFlow2023
//
//  Created by Sarah Reichelt in June 2023.
//

import SwiftUI

struct SidebarView: View {
  @Binding var selectedDataLinkId: Int?

  var body: some View {
    List(
      DataLink.dataLinks,
      selection: $selectedDataLinkId) { link in
        ListRowView(
          title: link.title,
          imageNumber: link.id
        )
        .tag(link.id)
      }
      .frame(minWidth: 200)
  }
}

#Preview {
  SidebarView(selectedDataLinkId: .constant(1))
    .frame(width: 200)
}

struct ListRowView: View {
  let title: String
  let imageNumber: Int

  var body: some View {
    HStack {
      Image(systemName: "\(imageNumber).square")
        .padding(6)
        .font(.largeTitle)
      Text(title)
        .font(.headline)
    }
  }
}
