//
//  Reservation.swift
//  appPiloto
//
//  Created by Carlos Mata on 6/10/24.
//

import Foundation
import FirebaseFirestore

struct Reservation: Codable{
  @DocumentID var idReserva: String?
  var idRestaurant: String
  var restaurant: String
  var date: Date
  var numberOfPeople: Int
  var phoneNumber: String
}
