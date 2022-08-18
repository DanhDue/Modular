//
//  CategoryHome.swift
//  Modular
//
//  Created by DanhDue ExOICTIF on 18/08/2022.
//

import SwiftUI

struct CategoryHome: View {

    @EnvironmentObject var modelData: ModelData

    var body: some View {
        NavigationView {
            NoSeparatorList(modelData.categories.keys.sorted(), id: \.self) { key in
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                Spacer().frame(height: 7).listRowBackground(Color.white.opacity(0))
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key] ?? [])
                    Spacer().frame(height: 7)
                }.listRowInsets(EdgeInsets()).listRowBackground(Color.white.opacity(0))
            }.listRowInsets(EdgeInsets())
            .navigationTitle("Featured")
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
            .listRowBackground(Color.blue)
            .listRowInsets(EdgeInsets())
        }.padding(.all, .zero).navigationBarTitleDisplayMode(.large)
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome().environmentObject(ModelData())
    }
}
