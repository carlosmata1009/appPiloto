//
//  RestaurantDetailView.swift
//  appPiloto
//
//  Created by Carlos Mata on 5/29/24.
//

import SwiftUI
import Firebase

struct RestaurantDetailView: View {
  var restaurant: String
  @State var numberOfPeople: Int = 0
  @State var date: Date = Date()
  @State var authViewModel = UserAuthenticationViewModel.shared
  var body: some View {
    if(Auth.auth().currentUser == nil){
      Text("You are not logged, sign in or create a new account.")
      HStack{
        NavigationLink{
          LoginView()
        }label: {
          Text("Login")
            .padding()
            .background(
              RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color.blue).opacity(0.2)
            )
        }
        .buttonStyle(.plain)
        
        NavigationLink{
          RegistrationView()
        }label: {
          Text("Register")
            .padding()
            .background(
              RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color.blue).opacity(0.2)
            )
        }
        .buttonStyle(.plain)
      }
    }else{
      ScrollView{
        VStack(alignment: .leading) {
          GeometryReader { geometry in
            Image(restaurant)
              .resizable()
              .scaledToFill()
              .frame(width: geometry.size.width, height: 200)
              .clipped()
          }
          .frame(height: 200)
          
          
          VStack(alignment: .leading, spacing: 20) {

            SquareImage(icon: "calendar", textTitle: "Date", textDate: "Fri, Jun 25", textHour: "4:00 PM")
            
            HStack {
              Text("Who's coming")
                .font(.callout)
              Spacer()
              Picker(selection: $numberOfPeople) {
                ForEach(1..<20) {
                  Text("\($0) guests")
                }
              } label: {}
                .accentColor(.black)
            }
            
            Text("Restaurant details")
              .font(.title2)
              .bold()
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
              VStack {
                Image(systemName: "fork.knife")
                  .resizable()
                  .frame(width: 20, height: 20)
                Text("Cuisine")
                Text("Japanase")
                  .foregroundStyle(Color("colorText"))
              }
              .frame(width: 140)
              .padding()
              .background(
                RoundedRectangle(cornerRadius: 10)
                  .stroke(lineWidth: 2)
                  .foregroundStyle(Color("colorYellow"))
              )
              
              VStack {
                Image(systemName: "mappin")
                  .resizable()
                  .frame(width: 9, height: 20)
                Text("Location")
                Text("Madrid")
                  .foregroundStyle(Color("colorText"))
              }
              .frame(width: 140)
              .padding()
              .background(
                RoundedRectangle(cornerRadius: 10)
                  .stroke(lineWidth: 2)
                  .foregroundStyle(Color("colorYellow"))
              )
            }
            
            SquareImage(icon: "phone", textTitle: "Phone number", textDate: "628 894 025")
            
            HStack {
              Spacer()
              Button {} label: {
                Text("Reserve")
                  .bold()
                  .fontDesign(.monospaced)
                  .foregroundStyle(.white)
                  .padding()
                  .frame(maxWidth: .infinity)
                  .background(
                    RoundedRectangle(cornerRadius: 25)
                      .tint(.green)
                      
                  )
              }
              Spacer()
            }
          }
          .padding()
          
        }
        .navigationTitle("Yayuki Sushi")
        .navigationBarTitleDisplayMode(.inline)
      }
    }
  }
}


#Preview {
  NavigationStack{
    RestaurantDetailView(restaurant: "1", date: Date())
  }
}
