//
//  LandmarkList.swift
//  Modular
//
//  Created by DanhDue ExOICTIF on 11/08/2022.
//

import SwiftUI

struct LandmarkList: View {

    @State private var showFavoritesOnly = false
    var filterredList: [Landmark] {
        landmarks.filter { landmark in
            (showFavoritesOnly == false || landmark.isFavorite == true)
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                List(filterredList) { landmark in
                    NavigationLink(
                        destination: VStack {
                            LandmarkDetail(landmark: landmark)
                            Spacer()
                        },
                        label: {
                        VStack {
                            LandmarkRow(landmark: landmark).listRowInsets(EdgeInsets())
                            Spacer()
                        }
                    })
                }
                .navigationTitle("Landmarks")
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList().previewDevice(PreviewDevice(rawValue: "iPhone 12"))
//        ForEach(["iPhone 12", "iPhone 11 Pro", "iPhone SE (2nd generation)"], id: \.self) { deviceName in
//            LandmarkList().previewDevice(PreviewDevice(rawValue: deviceName))
//        }
    }
}
