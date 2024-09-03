//
//  FirestoreService.swift
//  appPiloto
//
//  Created by Carlos Mata on 6/26/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol FirestoreServices{
  func saveUser(user: User) async throws
  func getLocationsFromUser() async throws -> [Location]
  func addLocation(location: Location) async throws
}

class FirestoreService: FirestoreServices{
  
  private let auth: Auth
  private let database: Firestore
  private let userVM: UserAuthenticationViewModel
  
  init(auth: Auth = Auth.auth(), database: Firestore = Firestore.firestore(), userVM: UserAuthenticationViewModel = UserAuthenticationViewModel()) {
    self.auth = auth
    self.database = database
    self.userVM = userVM
  }
  
  func saveUser(user: User) async throws {
    guard let currentUser = try userVM.getCurrentUser()else{throw ErrorUser.currentUserNil}
    let db = database.collection("Users").document(currentUser.uid)
    let userFormattedDictionary = user.dictionary
    try await db.setData(userFormattedDictionary)
  }
  
  func getLocationsFromUser() async throws -> [Location]{
    guard let currentUser = try userVM.getCurrentUser()else{throw ErrorUser.currentUserNil}
    let db = database.collection("Users").document(currentUser.uid)
    let document = try await db.getDocument()
    if let data = document.get("location") as? [[String: Any]]{
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase
      let json = try JSONSerialization.data(withJSONObject: data)
      let locations = try decoder.decode([Location].self, from: json)
      return locations
    }else{
      print("Not found")
    }
    return []
  }
  
  func addLocation(location: Location) async throws {
    guard let currentUser = try userVM.getCurrentUser()else{throw ErrorUser.currentUserNil}
    let db = database.collection("Users").document(currentUser.uid)
    //Getting all the locations from the currentUser
    let locations = try await getLocationsFromUser()
    
    var locationsFormattedDictionary: [[String: Any]] = []
    
    for location in locations{
      let loc: [String: Any] = [
      "nameofStreet": location.nameofStreet,
      "latitude": location.latitude,
      "longitude": location.longitude,
      "isActive": false
      ]
      locationsFormattedDictionary.append(loc)
    }
    //Adding new location
    locationsFormattedDictionary.insert(location.dictionary, at: 0)
    
    try await db.updateData([
      "location": locationsFormattedDictionary
    ])
  }
  func activateLocation(location: Location, locations: [Location]) async throws {
    guard let currentUser = try userVM.getCurrentUser()else{return}
    let db = database.collection("Users").document(currentUser.uid)
    guard let index = locations.firstIndex(of: location) else{throw ErrorUser.currentUserNil}
    var activateLocation = locations[index]
    activateLocation.isActive = true
    var locationsFormattedDictionary: [[String: Any]] = []
    
    for location in locations{
      let loc: [String: Any] = [
      "nameofStreet": location.nameofStreet,
      "latitude": location.latitude,
      "longitude": location.longitude,
      "isActive": false
      ]
      locationsFormattedDictionary.append(loc)
    }
    locationsFormattedDictionary.remove(at: index)
    locationsFormattedDictionary.insert(activateLocation.dictionary, at: 0)
    try await db.updateData([
      "location": locationsFormattedDictionary
    ])
  }
  
  func deleteLocation(location: Location, locations: [Location])async throws{
    guard let currentUser = try userVM.getCurrentUser()else{return}
    let db = database.collection("Users").document(currentUser.uid)
    guard let index = locations.firstIndex(of: location) else{throw ErrorUser.currentUserNil}
    var locationsFormattedDictionary: [[String: Any]] = []
    for location in locations{
      let loc: [String: Any] = [
      "nameofStreet": location.nameofStreet,
      "latitude": location.latitude,
      "longitude": location.longitude,
      "isActive": location.isActive
      ]
      locationsFormattedDictionary.append(loc)
    }
    locationsFormattedDictionary.remove(at: index)
    try await db.updateData([
      "location": locationsFormattedDictionary
    ])
  }
  
}
