//
//  CatalogARApp.swift
//  CatalogAR
//
//  Created by Alondra García Morales on 27/03/24.
//

import SwiftUI

@main
struct CatalogARApp: App {
    
    @StateObject var setting = Settings()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(setting)
        }
    }
}
