//
//  PersistDataUserDefaults.swift
//  appPiloto
//
//  Created by Carlos Mata on 5/28/24.
//

import Foundation
@Observable
class UserDefaultViewModel{
  let userDefaultService: UserDefaultService = UserDefaultService()
  var currentLocationUserDefault: Location? = nil
  
  func saveLocation(location: Location) throws{
    do{
      try userDefaultService.saveLocation(location: location)
    }catch{
      throw error
    }
  }
  
  func retriveLocation()throws -> [Location]{
    do{
      return try userDefaultService.retriveLocation()
    }catch{
      throw error
    }
   }
  func retriveSelectedLocation()throws {
    do{
      self.currentLocationUserDefault = try userDefaultService.retriveSelectedLocation()
    }catch{
      throw error
    }
  }
}
