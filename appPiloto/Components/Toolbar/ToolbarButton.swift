//
//  ToolbarButton.swift
//  appPiloto
//
//  Created by Carlos Mata on 6/4/24.
//

import SwiftUI

struct ToolbarButton: View {
  @Binding var selectedOption: OptionsBottomBar
  var image: String
  var text: String

  var body: some View {
    VStack{
      Button{
        selectedOption = option
      }label:{
        Image(systemName: image)
          .font(.title2)
          .symbolVariant(selectedOption == option ? .fill : .none)
          .foregroundStyle(selectedOption == option ? .black : .gray)
      }
      Text(text)
        .font(.system(size: 10))
    }
  }
}

#Preview {
  ToolbarButton(selectedOption: .constant(.home), image: "calendar.circle", text: "Reservations", option: .home)
}
