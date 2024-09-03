//
//  ContactsView.swift
//  appPiloto
//
//  Created by Carlos Mata on 6/4/24.
//

import SwiftUI
import Firebase
struct ContactsView: View {
  @State var authVM = UserAuthenticationViewModel.shared
  var body: some View {
    NavigationStack{
      Text("Hello")
      .toolbar{
        ToolbarItem(placement: .destructiveAction) {
          NavigationLink{
            MainView()
          }label: {
            Button{
              Task{
                do{
                  try authVM.signOut()
                }catch{
                  throw error
                }
              }
            }label:{
              Text("Sign out")
            }
          }
        }
      }
    }
  }
}


#Preview {
    ContactsView()
}
