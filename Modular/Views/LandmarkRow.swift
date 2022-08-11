//
//  LandmarkRow.swift
//  Modular
//
//  Created by DanhDue ExOICTIF on 11/08/2022.
//

import SwiftUI

struct LandmarkRow: View {

    var landmark: Landmark?

    var body: some View {
        HStack {
            landmark?.image.resizable().frame(width: 36, height: 36, alignment: .center)
            Text(landmark?.name ?? "")
            Spacer()
            Image(systemName: landmark?.isFavorite == true ? "star.fill" : "star").foregroundColor(.yellow)
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
