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
    func tappableBackground() -> some View {
        background(Color.black.opacity(0.001))
    }
    func removeListRowFormatting() -> some View {
        self
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .listRowBackground(Color.clear)
    }
    func addinggradientBackgroundForText() -> some View {
        
            background(
                LinearGradient(colors: [
                    Color.red.opacity(0),
                    Color.blue.opacity(0.3),
                    Color.orange.opacity(0.4)
                                       ], startPoint: .top, endPoint: .bottom)
            )
    }
}
