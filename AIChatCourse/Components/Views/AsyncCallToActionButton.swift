//
//  AsyncCallToActionButton.swift
//  AIChatCourse
//
//  Created by Avinash Kumar on 06/03/26.
//

import SwiftUI

struct AsyncCallToActionButton: View {
    var isloading: Bool = false
    var title: String = "Save"
    var action: () -> Void = { }
    var body: some View {
        ZStack {
            if isloading {
                ProgressView()
                    .tint(.white)
            } else {
                Text(title)
            }
        }
     
            .callToActionButton()
            .anyButton(.press) {
                action()
            }
            .disabled(isloading)
    }
}
private struct PreviewView: View {
    @State private var isLoading: Bool = false
     var body: some View {
         AsyncCallToActionButton(
            isloading: isLoading,
            title: "Finish"
         ) {
             isLoading = true
             Task {
                 try? await Task.sleep(for: .seconds(3))
                 isLoading = false
             }
         }
    }
}
#Preview {
   PreviewView()
        .padding()
}
