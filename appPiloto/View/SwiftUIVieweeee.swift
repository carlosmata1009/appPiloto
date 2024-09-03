//
//  SwiftUIVieweeee.swift
//  appPiloto
//
//  Created by Carlos Mata on 6/25/24.
//

import SwiftUI

import SwiftUI

struct HomeView1: View {
    @State private var searchText = ""

    var body: some View {
        VStack {
            // Location label
            Text("Location: \(UserLocation.shared.location)")
               .font(.headline)
               .padding()

            // Search bar
            SearchBar(text: $searchText)
               .padding(.horizontal)

            // ScrollView for restaurants
            ScrollView {
              ForEach(restaurants, id: \.address) { restaurant in
                    RestaurantRow(restaurant: restaurant)
                }
            }
           .padding(.horizontal)

            // Bottom bar
            BottomBar()
               .padding(.bottom)
        }
    }
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
               .foregroundColor(.gray)
            TextField("Search", text: $text)
               .foregroundColor(.primary)
        }
       .padding(8)
       .background(Color.white)
       .cornerRadius(10)
    }
}

struct RestaurantRow: View {
    let restaurant: Restaurant2

    var body: some View {
        HStack {
            Image(restaurant.image)
               .resizable()
               .frame(width: 50, height: 50)
            VStack(alignment:.leading) {
                Text(restaurant.name)
                   .font(.headline)
                Text(restaurant.address)
                   .font(.subheadline)
            }
        }
       .padding(.vertical)
    }
}

struct BottomBar: View {
    var body: some View {
        HStack {
            Button(action: {
                // Navigate to Home view
            }) {
                Image(systemName: "house")
                   .imageScale(.large)
                   .padding(.horizontal)
            }
            Button(action: {
                // Navigate to Reservation view
            }) {
                Image(systemName: "calendar")
                   .imageScale(.large)
                   .padding(.horizontal)
            }
            Button(action: {
                // Navigate to Profile view
            }) {
                Image(systemName: "person")
                   .imageScale(.large)
                   .padding(.horizontal)
            }
        }
       .padding(.horizontal)
       .background(Color.white)
       .shadow(radius: 10)
    }
}

struct UserLocation {
    static let shared = UserLocation()
    var location = "New York, NY"
}

struct Restaurant2 {
    let id = UUID()
    let name: String
    let address: String
    let image: String

    init(name: String, address: String, image: String) {
        self.name = name
        self.address = address
        self.image = image
    }
}

let restaurants = [
    Restaurant2(name: "Restaurant 1", address: "123 Main St", image: "restaurant1"),
    Restaurant2(name: "Restaurant 2", address: "456 Elm St", image: "restaurant2"),
    Restaurant2(name: "Restaurant 3", address: "789 Oak St", image: "restaurant3"),
]

#Preview{
  HomeView1()
}
