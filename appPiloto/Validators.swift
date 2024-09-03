//
//  Validators.swift
//  appPiloto
//
//  Created by Carlos Mata on 6/7/24.
//

import Foundation

protocol Validator {
  func validate(_ value: String) throws
}

enum ValidationError: Error{
  case invalidEmail
  case invalidPassword
  case errorGeneral(Error)
  case invalidPhoneNumberNotANumber
  case invalidPhoneNumber
}

enum ErrorUser: Error{
  case validationFailed(ValidationError)
  case general(Error)
  case currentUserNil
  case errorSavingUser(Error)
}

struct EmailValidator: Validator{
  func validate(_ value: String) throws {
    let emailValidationRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)
    if !emailPredicate.evaluate(with: value) {
      throw ValidationError.invalidEmail
    }
  }
}

struct PasswordValidator: Validator{
  func validate(_ value: String) throws {
    if(value.count < 6){
      throw ValidationError.invalidPassword
    }
  }
}

struct PhoneNumberValidator: Validator{
  func validate(_ value: String) throws {
    if value.count != 9{
      throw ValidationError.invalidPhoneNumber
    }
    guard let _ = Int(value) else{throw ValidationError.invalidPhoneNumberNotANumber}
  }
}
