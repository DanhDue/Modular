//
//  Hike.swift
//  Modular
//
//  Created by DanhDue ExOICTIF on 17/08/2022.
//

import Foundation

struct Hike: Codable, Hashable, Identifiable {
    var id: Int?
    var name: String?
    var distance: Double?
    var difficulty: Double?

    var observations: [Observation]

    static var formatter = LengthFormatter()
    var distanceText: String {
        Hike.formatter.string(fromValue: distance ?? 0.0, unit: .kilometer)
    }

    struct Observation: Codable, Hashable {
        var distanceFromStart: Double
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
}
