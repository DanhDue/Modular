//
//  NotificationView.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by DanhDue ExOICTIF on 22/08/2022.
//

import SwiftUI

struct NotificationView: View {
    
    var title: String?
    var message: String?
    var landmark: Landmark?
    
    var body: some View {
        VStack {
            if landmark != nil {
                CircleImageView(image: landmark?.image.resizable())
                    .scaledToFit()
            }
            Text(title ?? "Unknow Landmark...")
                .font(.headline)
            Divider()
            Text(message ?? "You are within 5 miles of one of your favorite landmarks.")
                .font(.caption)
        }
        .lineLimit(0)
        .padding()
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(title: "Turtle Rock",
                         message: "You are within 5 miles of Turtle Rock.",
                         landmark: ModelData().landmarks[0])
    }
}
