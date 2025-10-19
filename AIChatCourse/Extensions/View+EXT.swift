//
//  View+EXT.swift
//  AIChatCourse
//
//  Created by Avinash Kumar on 19/10/25.
//

import Foundation
import SwiftUI
extension View {
    func callToActionButton() -> some View {
        self
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
        
            .background(.accent)
            .cornerRadius(16)
        
    }
}
