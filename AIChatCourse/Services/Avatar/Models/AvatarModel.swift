//
//  AvatarModel.swift
//  AIChatCourse
//
//  Created by Avinash Kumar on 18/11/25.
//

import Foundation
struct AvatarModel: Hashable {
    let avtarId: String
    let name: String?
    let characterOption: CharacterOption?
    let characterAction: CharacterAction?
    let characterLocation: CharacterLocation?
    let profileImageName: String?
    let autohorId: String?
    let dateCreated: Date?
    init(
        avtarId: String,
        name: String? = nil,
        characterOption: CharacterOption? = nil,
        characterAction: CharacterAction? = nil,
        characterLocation: CharacterLocation? = nil,
        profileImageName: String? = nil,
        autohorId: String? = nil, 
        dateCreated: Date? = nil
    ) {
        self.avtarId = avtarId
        self.name = name
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
        self.profileImageName = profileImageName
        self.autohorId = autohorId
        self.dateCreated = dateCreated
    }
    
    var characterDescription: String {
        AvatarDescriptionBuilder(avatar: self).characterDescription
    }
    static var mock: Self {
        mocks[0]
    }
    
    static var mocks: [Self] {
        [
            AvatarModel(avtarId: UUID().uuidString, name: "Alpha", characterOption: .alien, characterAction: .smiling, characterLocation: .park, profileImageName: Constants.randomImage, autohorId: UUID().uuidString, dateCreated: .now),
            AvatarModel(avtarId: UUID().uuidString, name: "Beta", characterOption: .dog, characterAction: .eating, characterLocation: .forest, profileImageName: Constants.randomImage, autohorId: UUID().uuidString, dateCreated: .now),
            AvatarModel(avtarId: UUID().uuidString, name: "Gamma", characterOption: .cat, characterAction: .drinking, characterLocation: .mall, profileImageName: Constants.randomImage, autohorId: UUID().uuidString, dateCreated: .now),
            AvatarModel(avtarId: UUID().uuidString, name: "Delta", characterOption: .woman, characterAction: .shoppping, characterLocation: .city, profileImageName: Constants.randomImage, autohorId: UUID().uuidString, dateCreated: .now)
          
        ]
    }
   }
