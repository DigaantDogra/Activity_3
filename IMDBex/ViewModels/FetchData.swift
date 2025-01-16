//
//  FetchData.swift
//  IMDBex
//
//  Created by Digaant Dogra on 2025-01-14.
//

import Foundation

struct FetchService{
    
    private enum FetchError: Error {
        case badResponse
    }
    
    init() {
        fetchProductJson()
    }
    
    private(set) var products:[Product]?
    
    private let baseURL = URL(string: "https://mocki.io/v1/cd78685e-6893-4434-ba38-812130ce5a39")!
    
    func fetchProduct() async throws -> [Product]{
        
        // TODO: Fetch data
        let (data, response) = try await URLSession.shared.data(from: baseURL) // making a tuple
        
        // TODO: Handle response
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{ // this is gonna give us urlResponse
            throw FetchError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        // TODO: Decode data
        let productData = try decoder.decode([Product].self, from: data)
        print(productData)
        
        print("I have the data")
        // TODO: Return data
        return productData
    }
    
    private mutating func fetchProductJson(){
        if let url = Bundle.main.url(forResource: "products", withExtension: "json"){
            do{
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.products = try decoder.decode([Product].self, from: data)
            }catch{
                print("Error decoding JSON data: \(error)")
            }
        }
    }
    
    
}
