//
//  RMGetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by THL_Mac on 9/25/24.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    struct Info : Codable{
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMCharacter]
}
