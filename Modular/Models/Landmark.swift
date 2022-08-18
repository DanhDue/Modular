//
//  Landmark.swift
//  Modular
//
//  Created by DanhDue ExOICTIF on 11/08/2022.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int?
    var name: String?
    var city: String?
    var state: String?
    var park: String?
    var description: String?
    var imageName: String?
    var isFeatured: Bool? = false
    var isFavorite: Bool? = false

    var image: Image {
        Image(imageName ?? "")
    }

    private var coordinates: Coordinates?

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates?.latitude ?? 0.0,
            longitude: coordinates?.longitude ?? 0.0
        )
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double?
        var longitude: Double?
    }

    var category: Category?

    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}
