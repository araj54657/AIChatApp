//
//  ProfileView.swift
//  AIChatCourse
//
//  Created by Avinash Kumar on 14/10/25.
//

import SwiftUI

struct ProfileView: View {
    @State private var showSettingsView: Bool = false
    var body: some View {
        NavigationStack {
            Text("Profile")
                .navigationTitle("Profile")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                       settingsButton
}
                }
        }
        .sheet(isPresented: $showSettingsView) {
            Text("Settings")
            
        }
        
    }
    private var settingsButton: some View {
        Button {
            onSettingButtonPressed()
        } label: {
            Image(systemName: "gear")
                .font(.headline)
        }
    }
    private func onSettingButtonPressed() {
        showSettingsView = true
    }
}

#Preview {
    ProfileView()
}
