//
//  Movie.swift
//  IMDBex
//
//  Created by Digaant Dogra on 2025-01-09.
//

import Foundation

struct Product: Identifiable,Codable{
    let id: Int
    let title: String
    let cost: Int
    let productImageName: URL
    let productDescription: String
    let sellerDescription: String
    
    enum ProductKeys: String,CodingKey{
        case id
        case title
        case cost
        case productImageName
        case productDescription
        case sellerDescription
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: ProductKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.cost = try container.decode(Int.self, forKey: .cost)
        self.productImageName = try container.decode(URL.self, forKey: .productImageName)
        self.productDescription = try container.decode(String.self, forKey: .productDescription)
        self.sellerDescription = try container.decode(String.self, forKey: .sellerDescription)
    }
    
}


