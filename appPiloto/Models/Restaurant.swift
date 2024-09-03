//
//  RestaurantModel.swift
//  appPiloto
//
//  Created by Carlos Mata on 6/10/24.
//

import Foundation
import FirebaseFirestore

struct Restaurant: Codable{
  @DocumentID var idRestaurant: String?
  var nameRestaurant: String
  var nameOwner: String
  var reservation: [Reservation]
  var capacity: Int
  var location: Location
}
