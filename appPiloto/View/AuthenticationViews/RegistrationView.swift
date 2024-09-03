//
//  RegistrationView.swift
//  appPiloto
//
//  Created by Carlos Mata on 6/7/24.
//

import SwiftUI

struct RegistrationView: View {
  @State var name = ""
  @State var lastName = ""
  @State var phoneNumber = ""
  @State var email = ""
  @State var password = ""

  @State var authVM = UserAuthenticationViewModel()
  @State var firestoreVM = FirestoreViewModel()
  var body: some View {
    Section{
      VStack(alignment: .leading){
        TextFieldComponent(text: $name, hint: "Enter your name")
        TextFieldComponent(text: $lastName, hint: "Enter your last name")
        TextFieldComponent(text: $phoneNumber, hint: "Enter your phone number")
        TextFieldComponent(text: $email, hint: "Enter your email")
        TextFieldSecureComponent(text: $password, hint: "Enter your password")
        HStack{
          Spacer()
          Button{
            Task{
              do{
                try await authVM.createUser(email: email, password: password)
                try await firestoreVM.saveUser(user: User(name: name, lastName: lastName, phoneNumber: phoneNumber, email: email, reservas: [], location: []))
              }catch{
                print(error.localizedDescription)
              }
            }
          }label:{
            Text("Register")
              .foregroundStyle(Color.white)
              .padding()
              .background(
                RoundedRectangle(cornerRadius: 15)
                  .foregroundStyle(Color.blue).opacity(0.5)
              )
          }.buttonStyle(.plain)
          Spacer()
        }.padding()
        Spacer()
      }.padding()
    }header: {
      HStack{
        Text("Registration")
          .font(.title)
          .bold()
        Spacer()
      }.padding()
    }
  }
}

#Preview {
  RegistrationView()
}
