//
//  MovieDetail.swift
//  IMDBex
//
//  Created by Digaant Dogra on 2025-01-09.
//

import Foundation

import SwiftUI
struct ProductDetail: View {
    let product: Product
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                AsyncImage(url: product.productImageName) { image in
                    image
                        .resizable ()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 400)
                .clipShape(.rect(cornerRadius: 10))
                .shadow(radius: 8)
                .padding(.horizontal, 30)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("$\(product.cost)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("\(product.title)")
                        .font(.title2)
                    Divider()
                    
                    Text("Description")
                        .font(.headline)
                    Text(product.productDescription)
                        .font(.body)
                        .foregroundColor(.secondary)
                    Spacer()
                    
                    Text("Seller Description")
                        .font(.headline)
                    Text(product.sellerDescription)
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                    HStack {
                        Button(action: {
                            print("\(product.title) added to favorites!")
                        }) {
                            Label("Favorite", systemImage: "heart.fill")
                                .foregroundColor(.red)
                        }
                        .padding(.trailing)
                        
                        Button(action: {
                            let activityVC = UIActivityViewController(
                                activityItems: ["Check out this movie: \(product.title)!"],
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
        .navigationTitle(product.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProductDetail(product: FetchService().products![1])
}
