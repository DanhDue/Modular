//
//  ModularApp.swift
//  Modular
//
//  Created by DanhDue ExOICTIF on 19/08/2022.
//

import SwiftUI

@main
struct ModularApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ModelData())
        }
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
    }
}
