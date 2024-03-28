//
//  ControlView.swift
//  CatalogAR
//
//  Created by Alondra García Morales on 27/03/24.
//

import SwiftUI

struct ControlView: View {
    
    @Binding var showMenu : Bool
    var body: some View {
        VStack(alignment: .center){
            Spacer()
            HStack(alignment: .center){
                Button{
                    showMenu.toggle()
                } label:{
                    Image(systemName: "plus")
                        .font(.system(size: 35))
                        .foregroundStyle(.white)
                        .buttonStyle(PlainButtonStyle())
                }
                .frame(width: 50, height: 50)
                .sheet(isPresented: $showMenu){
                    MenuView(showMenu: $showMenu)
                }
            }
            .frame(maxWidth: 500)
            .padding(30)
            .background(Color.black.opacity(0.25))
        }
    }
}


