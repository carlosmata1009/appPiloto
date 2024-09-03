//
//  UserAuthenticationViewModel.swift
//  appPiloto
//
//  Created by Carlos Mata on 6/6/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@Observable
class UserAuthenticationViewModel{
  static let shared = UserAuthenticationViewModel()
  private let authService: UserAuthenticationService
  var localizaciones: [Location] = []
  
  init(authService: UserAuthenticationService = FirebaseUserAuthenticationService()) {
    self.authService = authService
  }
  
  //Create user in Firebase
  func createUser(email: String, password: String) async throws{
    do{
      try await authService.createUser(email: email, password: password)
    }catch let error as ValidationError{
      throw ErrorUser.validationFailed(error)
    }catch{
      throw ErrorUser.general(error)
    }
  }
  
  //Login to an actual user with email and password
  func loginUser(email: String, password: String) async throws{
    do{
      try await authService.loginUser(email: email, password: password)
    }catch let error as ValidationError{
      throw ErrorUser.validationFailed(error)
    }catch{
      throw ErrorUser.general(error)
    }
  }
  
  //Sign out current User
  func signOut() throws{
    do{
      try authService.signOut()
    }catch{
      throw error
    }
  }
  
  //Get current User from Firebase
  func getCurrentUser() throws -> UserFirebase? {
    do{
      return try authService.getCurrentUser()
    }catch{
      throw error
    }
  }
}
