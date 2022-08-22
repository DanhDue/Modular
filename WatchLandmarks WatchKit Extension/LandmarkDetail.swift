//
//  LandmarkDetail.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by DanhDue ExOICTIF on 22/08/2022.
//

import SwiftUI

struct LandmarkDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark?
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark?.id}) ?? -1
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center) {
                    CircleImageView(image: landmark?.image.resizable())
                        .scaledToFit()
                    Text(landmark?.name ?? "")
                        .font(.headline)
                        .lineLimit(0)
                    Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite.unwrap(defaultValue: false)) {
                        Text("Favorite")
                    }
                    Divider()
                    Text(landmark?.park ?? "")
                        .font(.caption)
                        .bold()
                        .lineLimit(0)
                    Divider()
                    Text(landmark?.state ?? "")
                        .font(.caption)
                    Divider()
                    MapView(coordinate: landmark?.locationCoordinate).scaledToFit()
                }.padding()
            }
        }
        .navigationTitle("Landmarks")
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        return Group {
            LandmarkDetail(landmark: modelData.landmarks[0])
                .environmentObject(modelData)
                .previewDevice("Apple Watch Series 5 - 44mm")
            LandmarkDetail(landmark: modelData.landmarks[0])
                .environmentObject(modelData)
                .previewDevice("Apple Watch Series 5 - 40mm")
        }
    }
}
