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
                   TabBarView()
                }
            },
            onboardingView: {
               WelcomeView()
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
