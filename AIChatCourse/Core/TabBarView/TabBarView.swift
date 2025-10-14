//
//  TabBarView.swift
//  AIChatCourse
//
//  Created by Avinash Kumar on 14/10/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
        ExploreView()
            .tabItem {
                Label("Explore", systemImage: "eyes")
            }
            ChatsView()
            .tabItem {
                Label("Chats", systemImage: "bubble.left.and.bubble.right")
            }
           ProfileView()
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
        }
    }
}
#Preview {
    TabBarView()
}
