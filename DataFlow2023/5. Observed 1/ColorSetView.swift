//
//  ColorSetView.swift
//  DataFlow2023
//
//  Created by Sarah Reichelt in June 2023.
//

import SwiftUI

struct ColorSetView: View {
  // Using an Observable for reference-based data (classes)
  @State private var colorSet = ColorSet()

  // @State property to control when chooser is displayed
  @State private var showChooser = false

  var body: some View {
    ZStack {
      colorSet.backgroundColor
        .edgesIgnoringSafeArea(.all)


      VStack {
        Spacer()

        Image(systemName: "cat.fill")
          .foregroundStyle(colorSet.foregroundColor)
          .font(.system(size: 200))

        Spacer()

        Button(action: { showChooser = true }) {
          Text("Change Colors")
            .frame(width: 170, height: 50)
        }
        .buttonStyle(.borderedProminent)
        .padding()
      }
    }
    .navigationTitle("Observable")

    .popover(isPresented: $showChooser) {
      // present the popover, passing the Observable
      // ColorChooser accepts it as a @Bindable so passes changes back
      ColorChooser(colorSet: colorSet)

      // changes to this object get passed back automatically
      // and used to update this view
    }
  }
}

#Preview {
  ColorSetView()
}
