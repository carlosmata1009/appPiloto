//
//  FirestoreViewModel.swift
//  appPiloto
//
//  Created by Carlos Mata on 6/26/24.
//

import Foundation

@Observable
class FirestoreViewModel{
  static let shared = FirestoreViewModel()
  var localizaciones: [Location] = []
  private let firService: FirestoreService
  
  init(firService: FirestoreService = FirestoreService()) {
    self.firService = firService
  }
  func saveUser(user: User) async throws{
    do{
      try await firService.saveUser(user: user)
    }catch let error as ErrorUser{
      throw ErrorUser.errorSavingUser(error)
    }
  }
  
  func getLocationsFromUser()async throws{
    do{
      self.localizaciones = try await firService.getLocationsFromUser()
    }catch{
      throw error
    }
  }
  func addLocation(location: Location) async throws{
    do{
      try await firService.addLocation(location: location)
    }catch{
      throw error
    }
  }
  func activateALocation(location: Location, locations: [Location]) async throws {
    do{
      try await firService.activateLocation(location: location, locations: locations)
    }catch{
     throw error
    }
  }
  func deleteLocation(location: Location, locations: [Location]) async throws{
    do{
      try await firService.deleteLocation(location: location, locations: locations)
    }catch{
     throw error
    }
  }
}
