//
//  ToolbarSwitcherView.swift
//  appPiloto
//
//  Created by Carlos Mata on 6/8/24.
//

import SwiftUI

struct MainView: View {
  
  var body: some View {
    NavigationStack{
      VStack(spacing: 0) {
        TabView{
          Group{
            HomeView()
              .tabItem {Label("Home", systemImage: "house")}
            ReservationsView()
              .tabItem {Label("Reservation", systemImage: "calendar")}
            ContactsView()
              .tabItem {Label("Contact", systemImage: "person")}
          }
          .toolbarBackground(.visible, for: .tabBar)
        }
      }
    }
  }
}

#Preview {
  MainView()
}
