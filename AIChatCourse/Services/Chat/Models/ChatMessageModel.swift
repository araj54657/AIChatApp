//
//  ChatMessageModel.swift
//  AIChatCourse
//
//  Created by Avinash Kumar on 15/01/26.
//

import Foundation
struct ChatMessageModel: Identifiable {
    let id: String
    let chatId: String
    let authorId: String?
    let content: String?
    let seenByIds: [String]?
    let dateCreated: Date?
    init(
        id: String,
        chatId: String,
        authorId: String?,
        content: String?,
        seenByIds: [String]?,
        dateCreated: Date?
    ) {
        self.id = id
        self.chatId = chatId
        self.authorId = authorId
        self.content = content
        self.seenByIds = seenByIds
        self.dateCreated = dateCreated
    }
    func hasBeenSeenBy(userId: String) -> Bool {
        guard let seenByIds else { return false }
        return seenByIds.contains(userId)
    }
    static var mock: ChatMessageModel {
        mocks[0]
    }
    static var mocks: [ChatMessageModel] {
        let now = Date()
        return [
            ChatMessageModel(
                id: "msg1",
                chatId: "1",
                authorId: "user1",
                content: "hello , how are you",
                seenByIds: ["user2", "user3"],
                dateCreated: now
            ),
            ChatMessageModel(
                id: "msg2",
                chatId: "2",
                authorId: "user2",
                content: "I 'm doing well, thanks for asking",
                seenByIds: ["user1"],
                dateCreated: now.addingTimeInterval(minutes: -5)
            )
            
        ]
    }
}
