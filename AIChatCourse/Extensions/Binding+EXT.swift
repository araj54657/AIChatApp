//
//  Binding+EXT.swift
//  AIChatCourse
//
//  Created by Avinash Kumar on 29/05/26.
//

import SwiftUI
import Foundation

extension Binding where Value == Bool {
    
    init<T: Sendable>(ifNotNil value: Binding<T?>) {
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                value.wrappedValue = nil
            }
        }
    }
}
