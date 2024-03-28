//
//  Model.swift
//  CatalogAR
//
//  Created by Alondra García Morales on 27/03/24.
//

import SwiftUI
import RealityKit
import Combine

enum ModelCategory : CaseIterable{
    case comida
    case postres
    case sodas
    
    var label : String {
        get {
            switch self {
            case .comida:
                return "Food"
            case .postres:
                return "Desserts"
            case .sodas:
                return "Sodas"
            }
        }
    }
}

class Model {
    var name : String
    var category : ModelCategory
    var thumbnail : UIImage
    var modelEntity : ModelEntity?
    var scale : Float
    
    var cancellable : AnyCancellable?
    
    init(name : String, category: ModelCategory, scale : Float = 1.0){
        self.name = name
        self.category = category
        self.thumbnail = UIImage(named: name) ?? UIImage(systemName: "photo")!
        self.scale = scale
    }
    func loadModel(){
        let fileName = name + ".usdz"
        print(fileName)
        cancellable = ModelEntity.loadModelAsync(named: fileName)
            .sink(receiveCompletion: { loadCompletion in
                switch loadCompletion {
                case .failure(let error):
                    print("Error charging the model", error.localizedDescription)
                case .finished:
                    print("Success")
                    break
                }
            }, receiveValue: { modelEntity in
                self.modelEntity = modelEntity
                self.modelEntity?.scale *= self.scale
            })
    }
}

struct Models {
    var all : [Model] = []
    
    init(){
        all = [
            Model(name: "Apple", category: .comida, scale: 40/100),
            Model(name: "Avocado", category: .comida, scale: 10/100),
            Model(name: "CocaCola", category: .sodas, scale: 3/100),
            Model(name: "Cookie", category: .postres, scale: 5/100),
            Model(name: "Donut", category: .postres, scale: 3/100),
            Model(name: "Hamburger", category: .comida, scale: 20/100),
            Model(name: "Italian_Sandwich", category: .comida, scale: 25/100),
            Model(name: "Orange", category: .comida, scale: 40/100),
            Model(name: "Skewer", category: .comida, scale: 5/100),
            Model(name: "Sujahta", category: .comida, scale: 5/100)
        ]
    }
    
    func get(category: ModelCategory) -> [Model]{
        return all.filter( {$0.category == category} )
    }
}
