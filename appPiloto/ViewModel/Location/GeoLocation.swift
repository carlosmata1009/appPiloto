//
//  GeoLocation.swift
//  appPiloto
//
//  Created by Carlos Mata on 5/28/24.
//

import Foundation
import CoreLocation

enum LocationError: Error{
  case locationNotFound
  case generalError(Error)
}

@Observable 
final class GeoLocation: NSObject{
  
  private let geocoder = CLGeocoder()
  
  var address: String = ""
  
  func getLocationFromAdress() async throws -> Location?{
    do {
      
      let placemarks = try await geocoder.geocodeAddressString(address)
      guard let placemark = placemarks.first, let location = placemark.location else { throw LocationError.locationNotFound
      }
      address = placemark.name ?? ""
      return createLocation(from: location)
    } catch {
      throw LocationError.generalError(error)
    }
  }
  func getActualStreetLocation(latitude: Double, longitude: Double) async -> String{
    let location = CLLocation(latitude: latitude, longitude: longitude)
    var adressString = ""
    do{
      let locationsArray = try await geocoder.reverseGeocodeLocation(location)
      guard let placemark = locationsArray.first else{return ""}
      if let street = placemark.thoroughfare{
        adressString += street
        return street
      }
      
    }catch{
      print(error.localizedDescription)
    }
    return ""
  }
  private func createLocation(from location: CLLocation) -> Location {
    return Location(nameofStreet: address, latitude: String(location.coordinate.latitude), longitude: String(location.coordinate.longitude), isActive: true)
  }
}

