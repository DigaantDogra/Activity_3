//
//  ViewModel.swift
//  IMDBex
//
//  Created by Digaant Dogra on 2025-01-09.
//

import Foundation

@Observable
class HomeViewModel {
    enum FetchStatus{
        case notStarted
        case fetching
        case success
        case failed(message: String)
    }
    
    private(set) var status:FetchStatus = .notStarted
    
    private let fetcher = FetchService() // for running the fetch service functions
    
    var products: [Product]? = nil
    
    func getData() async {
        status = .fetching
        print("Still fetching")
        
        do{
            products = try await fetcher.fetchProduct()
            print("Fetched")
            
            status = .success
            print("success")
        }catch{
            status = .failed(message: "somthing went wrong!")
        }
    }
}
