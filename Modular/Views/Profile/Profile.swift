//
//  Profile.swift
//  Modular
//
//  Created by DanhDue ExOICTIF on 18/08/2022.
//

import Foundation

struct Profile {
    var userName: String?
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(userName: "DanhDue ExOICTIF")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
    
        var id: String { rawValue }
    }
}
