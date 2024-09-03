//
//  LoginView.swift
//  appPiloto
//
//  Created by Carlos Mata on 6/7/24.
//

import SwiftUI

struct LoginView: View {
  
  @State var email = ""
  @State var password = ""

  @State var authViewModel = UserAuthenticationViewModel.shared
    var body: some View {
      Section{
        VStack(alignment: .leading){
          TextFieldComponent(text: $email, hint: "Enter your email")
          TextFieldSecureComponent(text: $password, hint: "Enter your password")
          HStack{
            Spacer()
            Button{
              Task{
                do{
                  try await authViewModel.loginUser(email: email, password: password)
                }catch{
                  print(error.localizedDescription)
                }
              }
            }label:{
              Text("Login")
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
          Text("Login")
            .font(.title)
            .bold()
          Spacer()
        }.padding()
      }
    }
}

#Preview {
    LoginView()
}
