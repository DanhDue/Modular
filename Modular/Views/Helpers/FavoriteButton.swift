//
//  FavoriteButton.swift
//  Modular
//
//  Created by DanhDue ExOICTIF on 12/08/2022.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool?

    var body: some View {
        Button {
            isSet?.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet == true ? "star.fill" : "star")
                .foregroundColor(isSet == true ? .yellow : .gray)
                .labelStyle(IconOnlyLabelStyle())
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
