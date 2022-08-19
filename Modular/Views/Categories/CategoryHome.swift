//
//  CategoryHome.swift
//  Modular
//
//  Created by DanhDue ExOICTIF on 18/08/2022.
//

import SwiftUI

struct CategoryHome: View {

    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    PageView(pages: modelData.features.map {
                        FeatureCard(landmark: $0)
                    }).aspectRatio(3 / 2, contentMode: .fit).listRowInsets(EdgeInsets())
                    Spacer().frame(height: 7).listRowBackground(Color.white.opacity(0))
                    ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                        CategoryRow(categoryName: key, items: modelData.categories[key] ?? [])
                        Spacer().frame(height: 7)
                    }
                }
            }
            .navigationTitle("Featured")
            .navigationViewStyle(StackNavigationViewStyle())
            .listRowBackground(Color.blue)
            .listRowInsets(EdgeInsets())
            .listStyle(.inset)
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost().environmentObject(modelData)
            }
        }.padding(.all, .zero).navigationBarTitleDisplayMode(.large)
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome().environmentObject(ModelData())
    }
}
