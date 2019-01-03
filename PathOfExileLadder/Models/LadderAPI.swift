//
//  LadderAPI.swift
//  PathOfExileLadder
//
//  Created by Ian Bailey on 12/21/18.
//  Copyright © 2018 Ian Bailey. All rights reserved.
//

import Foundation

struct LadderData: Codable {
    let entries: [POELadder]
}

struct POELadder: Codable {
    let rank: Int
    let dead: Bool
    let online: Bool
    let character: CharacterData
    let account: AccountData
}
struct CharacterData: Codable{
    enum CodingKeys: String, CodingKey{
    case name
    case level
    case classString = "class"
}
    let name: String
    let level: Int
    let classString: String
}
struct AccountData: Codable {
    let name: String
    let challenges: ChallengeData
}
struct ChallengeData: Codable {
    let total: Int
}
