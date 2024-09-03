//
//  Location.swift
//  appPiloto
//
//  Created by Carlos Mata on 6/10/24.
//

import Foundation

struct Location: Codable, Hashable{
  var nameofStreet: String
  var latitude: String
  var longitude: String
  var isActive: Bool
  var dictionary: [String: Any]{
    return[
        "nameofStreet": nameofStreet,
        "latitude": latitude,
        "longitude": longitude,
        "isActive": isActive
    ]
  }
}
