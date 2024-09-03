//
//  iconGetLocation.swift
//  appPiloto
//
//  Created by Carlos Mata on 6/10/24.
//

import SwiftUI

struct iconGetLocation: View {
  @State var managerlocation = LocationManager.shared
  var geoLocation = GeoLocation()
    var body: some View {
      Button{
        managerlocation.requestLocation()
        Task{
          await geoLocation.getActualStreetLocation(latitude:  managerlocation.currentLocation?.coordinate.latitude ?? 0.00, longitude:         managerlocation.currentLocation?.coordinate.longitude ?? 0.00)
        }
      }label:{
        Image(systemName: "location")
      }
        
    }
}

#Preview {
    iconGetLocation()
}
