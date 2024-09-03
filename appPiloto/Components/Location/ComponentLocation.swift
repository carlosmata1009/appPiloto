//
//  ComponentLocation.swift
//  appPiloto
//
//  Created by Carlos Mata on 5/27/24.
//

import SwiftUI

struct ComponentLocation: View{

  @State var mostrarLocalizaciones: Bool = false
  @State var fireVM = FirestoreViewModel.shared
  var userDefaultVM = UserDefaultViewModel()
  var currentUser: Bool
  
  var body: some View{
    VStack(alignment: .leading){
      Text("Actual location:")
        .font(.caption)
        .foregroundStyle(.gray)
        
      Button{
        mostrarLocalizaciones.toggle()
      } label:{
        Label(
          title: { Text((currentUser ? fireVM.localizaciones.first?.nameofStreet ?? "" : userDefaultVM.currentLocationUserDefault?.nameofStreet) ?? "" ) },
          icon: { Image(systemName: "location") }
        ).font(.subheadline)
          .foregroundStyle(.black)
          .bold()
      }
      .sheet(isPresented: $mostrarLocalizaciones) {
        NavigationStack{
          LocationView( mostrarLocalizaciones: $mostrarLocalizaciones)
            .navigationTitle("Edit Location")
            .toolbarTitleDisplayMode(.inline)
        }
      }
    }.padding(.leading)
    
  }
}

#Preview {
  ComponentLocation(currentUser: true)
}
