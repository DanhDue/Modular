//
//  CategoryRow.swift
//  Modular
//
//  Created by DanhDue ExOICTIF on 18/08/2022.
//

import SwiftUI

struct CategoryRow: View {

    var categoryName: String?
    var items: [Landmark]

    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName ?? "").font(.headline).padding(.top, 5).padding(.leading, 15)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0, content: {
                    ForEach(items) { landmark in
                        NavigationLink(
                            destination: LandmarkDetail(landmark: landmark),
                            label: {
                                CategoryItem(landmark: landmark)
                            }
                        )
                    }
                })
            }
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {

    static var landmarks = ModelData().landmarks

    static var previews: some View {
        CategoryRow(categoryName: landmarks[0].category?.rawValue, items: Array(landmarks.prefix(3)))
    }
}
