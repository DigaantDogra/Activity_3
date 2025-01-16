//
//  MovieDetail.swift
//  IMDBex
//
//  Created by Digaant Dogra on 2025-01-09.
//

import Foundation

import SwiftUI
struct MovieDetailView: View {
    let movie: Movie
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image(movie.posterImageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 400)
                .cornerRadius(12)
                .shadow(radius: 8)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(movie.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("\(movie.genre) - \(movie.releaseYear)")
                        .font(.title2)
                        .foregroundColor(.gray)
                    Divider()
                    
                    Text("Description")
                        .font(.headline)
                    Text(movie.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            print("\(movie.title) added to favorites!")
                        }) {
                            Label("Favorite", systemImage: "heart.fill")
                                .foregroundColor(.red)
                        }
                        .padding(.trailing)
                        
                        Button(action: {
                            let activityVC = UIActivityViewController(
                                activityItems: ["Check out this movie: \(movie.title)!"],
                                applicationActivities: nil
                        )
                        UIApplication.shared.windows.first?.rootViewController?
                        .present(activityVC, animated: true, completion: nil)
                        }) {
                            Label("Share", systemImage: "square.and.arrow.up")
                                .foregroundColor(.blue)
                        }// this is the share btn
                    }
                    .padding(.top)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MovieDetailView(movie: FetchService().movies![1])
}
