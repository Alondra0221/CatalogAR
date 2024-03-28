//
//  MenuView.swift
//  CatalogAR
//
//  Created by Alondra García Morales on 27/03/24.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var showMenu : Bool
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false){
                CategoryView(showMenu: $showMenu)
            }.navigationTitle("Menu")
        }
    }
}


struct GridView: View{
    
    @Binding var showMenu : Bool
    var title : String
    var items : [Model]
    let gridItem = [GridItem(.fixed(150))]
    @EnvironmentObject var settings : Settings
    
    var body: some View{
        VStack(alignment: .leading){
            Text(title)
                .font(.title)
                .padding(.leading, 22)
            ScrollView(.horizontal, showsIndicators: false){
                LazyHGrid(rows: gridItem, spacing: 10){
                    ForEach(0..<items.count, id:\.self){ index in
                        let model = items[index]
                        Button{
                            print("select element")
                            model.loadModel()
                            settings.selectedModel = model
                            showMenu.toggle()
                        } label:{
                            Image(uiImage: model.thumbnail)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 200)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 8.0))
                        }
                    }
                }
            }
            .padding(.horizontal, 23)
            .padding(.vertical, 10)
        }
    }
}

struct CategoryView: View{
    
    @Binding var showMenu : Bool
    let models = Models()
    
    var body: some View{
        VStack(alignment: .center){
            ForEach(ModelCategory.allCases, id:\.self){ category in
                let categorias = models.get(category: category)
                GridView(showMenu: $showMenu, title: category.label, items: categorias)
            }
        }
    }
}
