//
//  SwiftUIView.swift
//  appPiloto
//
//  Created by Carlos Mata on 5/28/24.
//

import SwiftUI

struct SwiftUView: View {
  @State var tex: String = ""
  var body: some View {
    TextField("Nuevo texto", text: $tex)
//    .padding()
//    .background(
//      RoundedRectangle(cornerRadius: 10)
//        .opacity(0.1)
//    )
    .searchable(text: $tex)
    .searchSuggestions{
      Text("App").searchCompletion("apple")
      Text("a").searchCompletion("pear")
      Text("ss").searchCompletion("banana")
    }
    .padding()
    Spacer()
  }
}

#Preview {
    SwiftUView()
}
