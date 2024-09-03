//
//  CellRestaurants.swift
//  appPiloto
//
//  Created by Carlos Mata on 5/29/24.
//

import SwiftUI

struct CellRestaurants: View {
  var imagen: Image
    var body: some View {

      VStack(alignment: .leading) {
        imagen
            .resizable()
            .scaledToFill()
            .frame(height: 150)
            .clipShape(Rectangle())
                      
        VStack(alignment: .leading, spacing: 5) {
          HStack {
            Text("Bar Manolo")
              
              .font(.headline)
              .foregroundColor(.black)
              
            Spacer()
              
            Text("4.3")
              .font(.subheadline)
              .padding(7)
              .background(Color.gray.opacity(0.2))
              .cornerRadius(20)
          }
          Text("Capacity: 40/50")
            
            .font(.subheadline)
            .foregroundColor(.gray)
        }
        .padding(.horizontal)
    }
    .padding(.bottom)
    .background(Color.white)
    .cornerRadius(15)
    .shadow(radius: 2)
  }
}

#Preview {
  CellRestaurants(imagen: Image("1"))
    .padding()
}
