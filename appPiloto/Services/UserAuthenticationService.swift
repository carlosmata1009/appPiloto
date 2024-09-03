//
//  UserAuthenticationService.swift
//  appPiloto
//
//  Created by Carlos Mata on 6/26/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol UserAuthenticationService{
  func createUser(email: String, password: String) async throws
  func loginUser(email: String, password: String) async throws
  func signOut() throws
  func getCurrentUser()throws -> UserFirebase?
}

class FirebaseUserAuthenticationService: UserAuthenticationService{
  private let auth: Auth
  private let emailValidator: Validator
  private let passwordValidator: Validator
  
  init(auth: Auth = Auth.auth(), emailValidator: Validator = EmailValidator(), passwordValidator: Validator = PasswordValidator()) {
    self.auth = auth
    self.emailValidator = emailValidator
    self.passwordValidator = passwordValidator
  }
  
  func createUser(email: String, password: String) async throws {
    try emailValidator.validate(email)
    try passwordValidator.validate(password)
    try await auth.createUser(withEmail: email, password: password)
  }
  
  func loginUser(email: String, password: String) async throws {
    try emailValidator.validate(email)
    try passwordValidator.validate(password)
    try await auth.signIn(withEmail: email, password: password)
  }
  
  func signOut() throws {
    try auth.signOut()
  }
  func getCurrentUser() -> UserFirebase? {
    guard let currentUser =  auth.currentUser else{return nil}
    return UserFirebase(uid: currentUser.uid, email: currentUser.email)
  }
}
