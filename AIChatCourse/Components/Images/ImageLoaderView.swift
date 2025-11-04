//
//  ImageLoaderView.swift
//  AIChatCourse
//
//  Created by Avinash Kumar on 24/10/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    var urlString: String = Constants.randomImage
    var resizingMode: ContentMode = .fill
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay(
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    .allowsTightening(false)
            )
            .clipped()
       
    }
}

#Preview {
    ImageLoaderView()
        .frame(width: 100, height: 200)
}
