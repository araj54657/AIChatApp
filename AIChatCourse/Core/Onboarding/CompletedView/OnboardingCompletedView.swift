//
//  OnboardingCompletedView.swift
//  AIChatCourse
//
//  Created by Avinash Kumar on 14/10/25.
//

import SwiftUI

struct OnboardingCompletedView: View {
    var selectedColor: Color = .blue
   @State private var isCompletingProfileSetup: Bool = false
    @Environment(AppState.self) private var root
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(" Setup Completed")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(selectedColor)
            Text("We've set up for profile and you're ready to start chatting")
        .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)

        }
        .frame(maxHeight: .infinity)
        .safeAreaInset(edge: .bottom, content: {
           ctaButton
        })
        .padding(24)
        .toolbar(.hidden, for: .navigationBar)
    }
    private var ctaButton: some View {
        ZStack {
            if isCompletingProfileSetup {
                ProgressView()
                    .tint(.white)
            } else {
                Text("Finish")
            }
        }
     
            .callToActionButton()
            .anyButton(.press) {
                onFinishButtonPressed()
            }
      
        .disabled(isCompletingProfileSetup)
    }
    func onFinishButtonPressed() {
        isCompletingProfileSetup = true
        Task {
            try await Task.sleep(for: .seconds(3))
           isCompletingProfileSetup = false
            root.updateViewState(showTabBarView: true)
        }
        
    }
    
}

#Preview {
    OnboardingCompletedView(selectedColor: .cyan)
        .environment(AppState())
}
