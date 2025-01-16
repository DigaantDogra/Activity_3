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
        fetchJsonMovie()
    }
    
    private(set) var movies:[Movie]?
    
    private let baseURL = URL(string: "https://mocki.io/v1/cb6cc05f-d9c2-4310-b46b-9f488d7751b0")!
    
    func fetchMovie() async throws -> [Movie]{
        
        // TODO: Fetch data
        let (data, response) = try await URLSession.shared.data(from: baseURL) // making a tuple
        
        // TODO: Handle response
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{ // this is gonna give us urlResponse
            throw FetchError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        // TODO: Decode data
        let movieData = try decoder.decode([Movie].self, from: data)
        print(movieData)
        
        print("I have the data")
        // TODO: Return data
        return movieData
    }
    
    private mutating func fetchJsonMovie(){
        if let url = Bundle.main.url(forResource: "movies", withExtension: "json"){
            do{
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.movies = try decoder.decode([Movie].self, from: data)
            }catch{
                print("Error decoding JSON data: \(error)")
            }
        }
    }
    
    
}
