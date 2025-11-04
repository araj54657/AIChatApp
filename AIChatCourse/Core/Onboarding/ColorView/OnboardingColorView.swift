//
//  OnboardingColorView.swift
//  AIChatCourse
//
//  Created by Avinash Kumar on 04/11/25.
//

import SwiftUI

struct OnboardingColorView: View {
    @State private var selectedColor: Color? 
    let profileColors: [Color] = [.red, .blue, .green, .yellow, .mint, .cyan, .teal, .indigo ]
    var body: some View {
        ScrollView {
            colorGrid
            
        }
        .safeAreaInset(edge: .bottom, alignment: .center, spacing: 16) {
            ZStack {
            if let  selectedColor {
                   ctaButton(selectedColor: selectedColor)
                    .transition(AnyTransition.move(edge: .bottom))
                }
              }
            .padding(24)
            .background(Color(uiColor: .systemBackground))
            
        }
        .animation(.bouncy, value: selectedColor)
        .toolbar(.hidden, for: .navigationBar)
    }
    private var colorGrid: some View {
        LazyVGrid(
            columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3),
            alignment: .center,
            spacing: 16,
            pinnedViews: [.sectionHeaders],
            content: {
                Section(content: {
                    ForEach(profileColors, id: \.self) { color in
                        Circle()
                            .fill(.accent)
                            .overlay {
                                color
                                    .clipShape(Circle())
                                    .padding(selectedColor == color ? 10 : 0)
                                    .onTapGesture {
                                        selectedColor = color
                                    }
                            }
                          
                    }
                }, header: {
                    Text("Select a Profile Color")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                    
                })
            }
        )
        .padding(.horizontal, 24)
    }
    private func ctaButton(selectedColor: Color) -> some View {
        NavigationLink {
            OnboardingCompletedView(selectedColor: selectedColor)
        } label: {
            Text("Continue")
                .callToActionButton()
            
        }
    }
}

#Preview {
    NavigationStack {
        OnboardingColorView()
    }
    .environment(AppState())
}
