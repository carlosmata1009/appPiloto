//
//  SwiftUIView.swift
//  appPiloto
//
//  Created by Carlos Mata on 5/27/24.
//

import SwiftUI

struct HomeView: View {
  @State var restaurant: String = ""
  @State var location = LocationManager.shared
  @State var fireVM = FirestoreViewModel.shared
  var imagenes = ["1", "2", "3", "4", "5", "6"]
  @State var bool: Bool = false
  
  var body: some View {
    NavigationStack{
      VStack{
        HStack{
          ComponentLocation(currentUser: bool)
          Spacer()
        }
        .padding(.horizontal)
        .onAppear{
          Task{
            do{
              try await fireVM.getLocationsFromUser()

              if let _ = try UserAuthenticationViewModel.shared.getCurrentUser(){
                bool = true
              }else{
                bool = false
              }
            }catch{
              
            }
          }
        }
        
        ComponentSearch(text: $restaurant, textoIndicativo: "Search your favorite restaurant").padding(.horizontal)
        
        ScrollView{
          LazyVStack(spacing: 0){
            ForEach(imagenes, id: \.self){ imagen in
              NavigationLink{
                RestaurantDetailView(restaurant: imagen)
              }label: {
                CellRestaurants(imagen: Image(imagen))
              }
            }
            .buttonStyle(.plain)
            .padding()
          }
        }
      }
    }
  }
}

#Preview {
  HomeView()
}
