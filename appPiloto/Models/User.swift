//
//  Model.swift
//  appPiloto
//
//  Created by Carlos Mata on 5/24/24.
//

import Foundation
import FirebaseFirestore

struct User: Codable{
  @DocumentID var userId: String?
  var name: String
  var lastName: String
  var phoneNumber: String
  var email: String
  var reservas: [Reservation]
  var location: [Location]
  var dictionary: [String: Any]{
    return[
        "name": name,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email,
        "reservas": reservas ,
        "location": location
        
    ]
  }
}

struct UserFirebase{
  let uid: String
  let email: String?
}
