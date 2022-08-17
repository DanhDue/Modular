//
//  ContentView.swift
//  Modular
//
//  Created by DanhDue ExOICTIF on 10/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}
