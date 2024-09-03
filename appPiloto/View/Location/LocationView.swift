//
//  EditLocationView.swift
//  appPiloto
//
//  Created by Carlos Mata on 5/27/24.
//

import SwiftUI
import Firebase

struct LocationView: View {
  @State var geoLocation: GeoLocation = GeoLocation()
  @State var userDefaultManager = UserDefaultViewModel()
  @State var localizaciones: [Location] = []
  @Binding var mostrarLocalizaciones: Bool
  @State var firestoreVM = FirestoreViewModel.shared
  @State var authVM = UserAuthenticationViewModel.shared
  
  var body: some View {
    NavigationStack{
      VStack(alignment: .leading){
        HStack{
          ComponentSearch(text: $geoLocation.address, textoIndicativo: "Enter new location")
          iconGetLocation()
        }
        .padding(.horizontal)
          .onSubmit {
            Task{
              do{
                guard let newLocation = try await geoLocation.getLocationFromAdress() else{
                  throw LocationError.locationNotFound
                }
                if let _ = try authVM.getCurrentUser(){
                  try await firestoreVM.addLocation(location: newLocation)
                  try await firestoreVM.getLocationsFromUser()
                  localizaciones = firestoreVM.localizaciones
                }else{
                  guard let newLocation = try await geoLocation.getLocationFromAdress() else{
                    throw LocationError.locationNotFound
                  }
                  try userDefaultManager.saveLocation(location: newLocation)
                  localizaciones = try userDefaultManager.retriveLocation()
                }
                geoLocation.address = ""
                }
              catch{
                print(LocationError.generalError(error))
              }
            }
          }
        Text("Recent Adresses")
          .font(.title2)
          .underline()
          .padding()
        
        CeldasLocalizacion(localizacion: $localizaciones)
          .onAppear{
            Task{
              if let _ = try authVM.getCurrentUser(){
                try await firestoreVM.getLocationsFromUser()
                localizaciones = firestoreVM.localizaciones
              }else{
                localizaciones = try userDefaultManager.retriveLocation()
              }
            }
          }
        Spacer()
      }
      .toolbar{
        ToolbarItem(placement: .topBarLeading){
          Button{
            mostrarLocalizaciones.toggle()
          }label:{
            HStack{
              Image(systemName: "xmark")
                .foregroundStyle(.black)
            }
          }
        }
      }
    }
  }
}

#Preview {
  LocationView(localizaciones: [], mostrarLocalizaciones: .constant(true))
}
