//
//  InitialView.swift
//  IMDBex
//
//  Created by Digaant Dogra on 2025-01-09.
//

import Foundation
import SwiftUICore
import SwiftUI

struct MovieListView: View {
    private var vm = MovieListViewModel()
    
    var body: some View {
        NavigationView {
            switch vm.status {
            case .notStarted:
                Text("Empty View")
            case .fetching:
                Text("Progress View")
            case .success:
                List(vm.movie ?? FetchService().movies!) { movie in
                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                        MovieView(movie: movie)
                    }
                }
                .navigationTitle("Movies")
            case .failed(let message):
                Text("\(message)")
            }
        }
        .onAppear{
            Task{
                await vm.getData()
            }
        }
    }
}

#Preview {
    MovieListView()
}
