//
//  LandmarkDetail.swift
//  Modular
//
//  Created by DanhDue ExOICTIF on 11/08/2022.
//

import SwiftUI

struct LandmarkDetail: View {

    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark?

    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark?.id }) ?? -1
    }


    var body: some View {
        VStack(alignment: .center) {
            MapView(coordinate: landmark?.locationCoordinate).frame(height: 300)
            CircleImageView(image: landmark?.image)
                .frame(width: 136, height: 136, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .offset(y: -86).padding(.bottom, -36)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark?.name ?? "").font(.title).foregroundColor(.green)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark?.park ?? "").font(.subheadline)
                    Spacer();
                    Text(landmark?.state ?? "").font(.subheadline)
                }
            }.padding()
            Divider().padding()
            HStack {
                Text(landmark?.description ?? "").padding(.horizontal, 13)
                Spacer()
            }
            Spacer()
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0]).environmentObject(modelData)
    }
}
