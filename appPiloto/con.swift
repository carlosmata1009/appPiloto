//
//  con.swift
//  appPiloto
//
//  Created by Carlos Mata on 5/27/24.
//

import SwiftUI

import SwiftUI

struct ConView: View {
    @State private var isSheetPresented = false

    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    isSheetPresented.toggle()
                }) {
                    Text("Show Sheet")
                }
            }
            .navigationBarTitle("Main View")
            .sheet(isPresented: $isSheetPresented) {
              NavigationStack{
                SheetView()
                  .toolbar{
                    ToolbarItem(placement: .topBarLeading){
                      Button{
                        isSheetPresented.toggle()
                      }label:{
                        HStack{
                          Image(systemName: "xmark")
                          
                        }
                        
                      }
                    }
                    ToolbarItem(placement: .principal) {
                      Text("Edit Location")
                    }
                  }
              }
            }
        }
    }
}

struct SheetView: View {
    var body: some View {
        VStack {
            Text("This is the sheet content")
          Text("")
        }
    }
}

#Preview{
  NavigationStack{
    ConView()
  }
}
