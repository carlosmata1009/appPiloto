//
//  CeldasLocalizacion.swift
//  appPiloto
//
//  Created by Carlos Mata on 5/28/24.
//

import SwiftUI

struct CeldasLocalizacion: View {
  @Binding var localizacion: [Location]
  @State var firVM = FirestoreViewModel.shared
  var body: some View {
    List(localizacion, id: \.self){ local in
      Button{
        Task{
          do{
            try await firVM.activateALocation(location: local, locations: localizacion)
            try await firVM.getLocationsFromUser()
            localizacion = firVM.localizaciones
          }catch{
            print(error.localizedDescription)
          }
        }
      } label:{
        HStack{
          Image(systemName: "mappin.circle.fill")
            .resizable()
            .scaledToFit()
            .foregroundStyle(.red)
            .frame(width: 25)
          Text(local.nameofStreet)
            .padding()
          Spacer()
          if(local.isActive == true){
            Image(systemName: "checkmark.circle")
              .resizable()
              .scaledToFit()
              .frame(width: 25)
              .foregroundStyle(.red)
          }
        }
      }
      .swipeActions{
        Button(role: .destructive){
          Task{
            do{
              try await firVM.deleteLocation(location: local, locations: localizacion)
              try await firVM.getLocationsFromUser()
              localizacion = firVM.localizaciones
            }catch{
              
            }
          }
        }label:{
          Image(systemName: "trash")
        }
      }
    }
    .listStyle(.plain)
  }
}

#Preview {
  CeldasLocalizacion(localizacion: .constant([]))
}
