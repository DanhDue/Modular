//
//  Utils.swift
//  Modular
//
//  Created by DanhDue ExOICTIF on 19/08/2022.
//

import Foundation
import SwiftUI

extension Binding {
     func unwrap<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}
