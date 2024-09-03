//
//  UserDefaultService.swift
//  appPiloto
//
//  Created by Carlos Mata on 6/26/24.
//

import Foundation

protocol UserDefaultServices{
  func saveLocation(location: Location) throws
  func retriveLocation()throws -> [Location]
  func retriveSelectedLocation()throws -> Location
}
struct UserDefaultService: UserDefaultServices{
  let defaults = UserDefaults.standard
  
  func saveLocation(location: Location) throws {
    let encoder = JSONEncoder()
    let data = try encoder.encode(location)
    defaults.set(data, forKey: "localizacion")
  }
  
  func retriveLocation()throws -> [Location] {
    if let data = defaults.data(forKey: "localizacion") {
      let decoder = JSONDecoder()
      let location = try decoder.decode(Location.self, from: data)
      return [location]
    }
    return []
  }
  func retriveSelectedLocation() throws-> Location {
    let locationsFromUD = try retriveLocation()
    guard let firstLocation = locationsFromUD.last else{return Location(nameofStreet: "Calle Goya", latitude: String(40.42494), longitude: String(3.67723), isActive: true)}
    return firstLocation
  }
}
