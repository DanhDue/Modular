//
//  CircleImageView.swift
//  Modular
//
//  Created by DanhDue ExOICTIF on 11/08/2022.
//

import Foundation
import SwiftUI

struct CircleImageView: View {
    var image: Image?

    var body: some View {
        image.clipShape(Circle()).overlay(Circle().stroke()).shadow(radius: 7)
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(image: Image("turtlerock"))
    }
}
