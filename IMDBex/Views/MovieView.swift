//
//  ContentView.swift
//  IMDBex
//
//  Created by Digaant Dogra on 2025-01-09.
//

import SwiftUI

struct MovieView: View {
    let movie: Movie
    var body: some View {
        HStack {
            AsyncImage(url: movie.posterImageName) { image in
                image
                    .resizable ()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .scaledToFit()
            .frame(width: 60, height: 90)
            .clipShape(.rect(cornerRadius: 20))
            
            VStack(alignment: .leading, spacing: 5) {
                Text(movie.title)
                .font(.headline)
                Text("\(movie.genre) - \(movie.releaseYear)")
                .font(.subheadline)
                .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    MovieView(movie: FetchService().movies![1])
}
