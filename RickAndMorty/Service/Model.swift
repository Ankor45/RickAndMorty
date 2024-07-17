//
//  Model.swift
//  RickAndMorty
//
//  Created by Andrei Kovryzhenko on 18.07.2024.
//

import Foundation

struct Character: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let location: Location
    let image: String
    let episode: [String]
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id
    }
}
struct Location: Codable {
    let name: String
}

struct APIResponse: Codable {
    let info: Info
    let results: [Character]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
