//
//  Settings.swift
//  CatalogAR
//
//  Created by Alondra García Morales on 27/03/24.
//

import Foundation
import SwiftUI
import Combine


class Settings : ObservableObject {
    
    
    @Published var selectedModel : Model? {
        // se activa cada ves que la variable tiene un cambio
        willSet(newValue){
            print("Seleccionaos el modelo")
        }
    }
    
    @Published var confirmedModel : Model? {
        // se activa cada ves que la variable tiene un cambio
        willSet(newValue){
            guard let model = newValue else { return}
            print("Confirmamos el modelo", model.name)
        }
    }
    
    var sceneObserver : Cancellable?
}
