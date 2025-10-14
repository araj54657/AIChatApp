//
//  AppView.swift
//  AIChatCourse
//
//  Created by Avinash Kumar on 14/10/25.
//

import SwiftUI

struct AppView: View {
    @AppStorage("showTabbaarView") var showTabBar: Bool = false
    
    var body: some View {
        AppViewBuilder(
            showTabBar: showTabBar,
            tabbarView: {
                ZStack {
                    Color.red.ignoresSafeArea()
                    Text("Tabbar")
                }
            },
            onboardingView: {
                ZStack {
                    Color.blue.ignoresSafeArea()
                    Text("Onboarding")
                }
            }
        )
        .onTapGesture {
            showTabBar.toggle()
        }
    }
}

#Preview("AppView-Tabbar") {
    AppView(showTabBar: true)
}

#Preview ("AppView-Onboarding"){
    AppView(showTabBar: false )
}
