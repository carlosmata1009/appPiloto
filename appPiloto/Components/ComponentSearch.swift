//
//  ComponentSearch.swift
//  appPiloto
//
//  Created by Carlos Mata on 5/27/24.
//

import SwiftUI

struct ComponentSearch: View {
  @Binding var text: String
  var textoIndicativo: String
  var body: some View {
    HStack {
        Image(systemName: "magnifyingglass")
        TextField(textoIndicativo, text: $text)
        .foregroundColor(.black)
    }
    .padding()
    .background(
        RoundedRectangle(cornerRadius: 20.0)
            .opacity(0.1)
    )
    .foregroundColor(.gray)
    
  }
}

struct icon:View{
  var body: some View{
    Button{} label:{ Image(systemName: "person.circle").resizable().scaledToFit().frame(width: 25) }
  }
}
#Preview {
  VStack(alignment: .leading){
    ComponentSearch(text: .constant(""), textoIndicativo: "s")
  }
}
