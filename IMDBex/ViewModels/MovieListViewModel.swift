//
//  ViewModel.swift
//  IMDBex
//
//  Created by Digaant Dogra on 2025-01-09.
//

import Foundation

@Observable
class MovieListViewModel {
    enum FetchStatus{
        case notStarted
        case fetching
        case success
        case failed(message: String)
    }
    
    private(set) var status:FetchStatus = .notStarted
    
    private let fetcher = FetchService() // for running the fetch service functions
    
    var movie: [Movie]? = nil
    
    func getData() async {
        status = .fetching
        print("Still fetching")
        
        do{
            movie = try await fetcher.fetchMovie()
            print("Fetched")
            
            status = .success
            print("success")
        }catch{
            status = .failed(message: "somthing went wrong!")
        }
    }
}
