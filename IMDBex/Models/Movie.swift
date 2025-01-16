//
//  Movie.swift
//  IMDBex
//
//  Created by Digaant Dogra on 2025-01-09.
//

import Foundation

struct Movie: Identifiable,Codable{
    let id: Int
    let title: String
    let genre: String
    let releaseYear: Int
    let posterImageName: URL
    let description: String
    
    enum MovieKeys: String,CodingKey{
        case id
        case title
        case genre
        case releaseYear
        case posterImageName
        case description
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: MovieKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.genre = try container.decode(String.self, forKey: .genre)
        self.releaseYear = try container.decode(Int.self, forKey: .releaseYear)
        self.posterImageName = try container.decode(URL.self, forKey: .posterImageName)
        self.description = try container.decode(String.self, forKey: .description)
    }
    
}


