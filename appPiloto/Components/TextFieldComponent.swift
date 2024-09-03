//
//  TextFieldComponent.swift
//  appPiloto
//
//  Created by Carlos Mata on 6/7/24.
//

import SwiftUI

struct TextFieldComponent: View {
  @Binding var text: String
  var hint: String
  var body: some View {
    TextField(text: $text) {
      Text(hint)
    }.padding()
    .background(
      RoundedRectangle(cornerRadius: 15)
        .foregroundStyle(.gray).opacity(0.2)
    )
  }
}

struct TextFieldSecureComponent: View {
  @Binding var text: String
  var hint: String
  var body: some View {
   SecureField(text: $text) {
      Text(hint)
    }.padding()
    .background(
      RoundedRectangle(cornerRadius: 15)
        .foregroundStyle(.gray).opacity(0.2)
    )
  }
}

#Preview {
  VStack{
    TextFieldComponent(text: .constant("Hola"), hint: "Enter your name")
    TextFieldSecureComponent(text: .constant(""), hint: "Enter password")
  }
}
