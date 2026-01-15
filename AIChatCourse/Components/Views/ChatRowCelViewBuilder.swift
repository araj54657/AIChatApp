//
//  ChatRowCelViewBuilder.swift
//  AIChatCourse
//
//  Created by Avinash Kumar on 15/01/26.
//

import SwiftUI

struct ChatRowCelViewBuilder: View {
    
    var currentUserId: String? = ""
    var chat: ChatModel = .mock
    var getAvatar: () async -> AvatarModel?
    var getLastChatMessage: () async -> ChatMessageModel?

    @State private var avatar: AvatarModel?
    @State private var lastChatMessage: ChatMessageModel?

    @State private var didLoadAvatar: Bool = false
    @State private var didLoadChatMessage: Bool = false
    
    private var isLoading: Bool {
        if didLoadAvatar && didLoadChatMessage {
            return false
        }
        
        return true
    }
    
    private var hasNewChat: Bool {
        guard let lastChatMessage, let currentUserId else { return false }
        return lastChatMessage.hasBeenSeenBy(userId: currentUserId)
    }
    
    private var subheadline: String? {
        if isLoading {
            return "xxxx "
        }
        
        if avatar == nil && lastChatMessage == nil {
            return "Error.."
        }
        
        return lastChatMessage?.content
    }

    var body: some View {
        ChatRowCellView(
            imageName: avatar?.profileImageName,
            headline: isLoading ? "xxxx xxxx" : avatar?.name,
            subheadline: subheadline,
            hasNewChat: isLoading ? false : hasNewChat
        )
        .redacted(reason: isLoading ? .placeholder : [])
        .task {
            avatar = await getAvatar()
            didLoadAvatar = true
        }
        .task {
            lastChatMessage = await getLastChatMessage()
            didLoadChatMessage = true
        }
    }
    
}

#Preview {
    VStack {
     
        ChatRowCelViewBuilder(chat: .mock, getAvatar: {
            try? await Task.sleep(for: .seconds(5))
            return .mock
        }, getLastChatMessage: {
            try? await Task.sleep(for: .seconds(5))
            return .mock
        })
        
        ChatRowCelViewBuilder(chat: .mock, getAvatar: {
            .mock
        }, getLastChatMessage: {
            .mock
        })
        
        ChatRowCelViewBuilder(chat: .mock, getAvatar: {
            nil
        }, getLastChatMessage: {
            nil
        })
    
       
    }
   }
