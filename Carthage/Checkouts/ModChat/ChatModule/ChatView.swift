//
//  ChatView.swift
//  ChatModule
//
//  Created by DanhDue ExOICTIF on 10/08/2022.
//

import Foundation
import SwiftUI

public struct ChatView: View {
    @State var userRating: CGFloat = 0.0
    @State var isUserRating = false
    @State var averageRating: CGFloat = 4.2
    @State var totalRatings = 34

    public init() {}

    public var body: some View {
            if self.isUserRating {
                VStack {
                    RatingsView(onDidRate: self.userDidRate, rating: self.$userRating)
                        .frame(width: .infinity, height: 100, alignment: .center)
                    Text("Rate it!")
                }
            } else {
                VStack {
                    RatingsView(rating: self.$averageRating)
                        .frame(width: .infinity, height: 100, alignment: .center)
                    Text(self.getRatingsSummary())
                    if userRating == 0.0 {
                        Button("Rate") {
                            self.isUserRating = true
                        }
                    }
                }
            }
        }

        private func userDidRate(_ rating: Int) {
            let newRating = CGFloat(rating)
            self.userRating = newRating
            let currentNumberOfRatings = self.totalRatings
            self.totalRatings += 1
            self.averageRating = ((self.averageRating * CGFloat(currentNumberOfRatings)) + newRating) / CGFloat(self.totalRatings)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: { self.isUserRating = false })
        }

        private func getRatingsSummary() -> String {
            let averageRatingToOneDecimalPlace = String(format: "%.1f", self.averageRating)
            return "\(averageRatingToOneDecimalPlace) average • \(self.totalRatings) ratings"
        }
}


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChatView().previewDevice("iPhone 12")
        }
    }
}
