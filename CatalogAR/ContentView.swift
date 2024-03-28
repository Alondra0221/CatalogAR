//
//  ContentView.swift
//  CatalogAR
//
//  Created by Alondra García Morales on 27/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            NavigationLink(destination : Home()){
                Text("Open Catalog")
                    .frame(width: 200, height: 40)
                    .font(.title2)
                    .padding()
                    .background(Color.black)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
            }
            .navigationTitle("Products Catalog")
            
            
        }
    }
}


