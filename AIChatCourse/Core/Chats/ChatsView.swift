//
//  ChatsView.swift
//  AIChatCourse
//
//  Created by Avinash Kumar on 14/10/25.
//

import SwiftUI

struct ChatsView: View {
    @State private var chats: [ChatModel] = ChatModel.mocks
    @State private var path: [NavigationPathOption] = []
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(chats) { chat in
                    ChatRowCelViewBuilder(
                        currentUserId: nil,
                        chat: chat,
                        getAvatar: {
                            try? await Task.sleep(for: .seconds(1))
                            return AvatarModel.mocks.randomElement()!
                        },
                        getLastChatMessage: {
                            try? await Task.sleep(for: .seconds(1))
                            return ChatMessageModel.mocks.randomElement()!
                        }
                    
                    )
                    .anyButton(.highlight, action: {
                        onChatPressed(chat: chat)
                    })
                    .removeListRowFormatting()
                }
            }
                .navigationTitle("Chats")
                .navigationDestinationForCoreModule(path: $path)
        }
    }
    private func onChatPressed(chat: ChatModel) {
        path.append(.chat(avatarId: chat.avatarId))
    }
}

#Preview { 
    ChatsView()
}
