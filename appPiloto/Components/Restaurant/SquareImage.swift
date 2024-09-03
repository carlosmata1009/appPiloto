//
//  SquareImage.swift
//  appPiloto
//
//  Created by Carlos Mata on 6/25/24.
//

import SwiftUI

struct SquareImage: View {
  var icon: String
  var textTitle: String
  var textDate: String
  var textHour: String?
  
    var body: some View {
      HStack{
        Image(systemName: icon)
          .resizable()
          .frame(width: 20, height: 20)
          .padding()
          .background(
            RoundedRectangle(cornerRadius: 10)
              .foregroundStyle(Color("colorYellow"))
          )
        VStack(alignment: .leading){
          Text(textTitle)
            .font(.callout)
          Text(textDate)
            .foregroundStyle(Color("colorText"))
            .font(.callout)
        }
        Spacer()
        if(textHour != nil){
          Text(textHour ?? "")
            .font(.callout)
            
        }
      }
    }
}

#Preview {
  SquareImage(icon: "calendar", textTitle: "Date", textDate: "Fri, Jun 25", textHour: "4.00PM")
}
