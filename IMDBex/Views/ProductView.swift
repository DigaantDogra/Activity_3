//
//  ContentView.swift
//  IMDBex
//
//  Created by Digaant Dogra on 2025-01-09.
//

import SwiftUI

struct MovieView: View {
    let product: Product
    var body: some View {
        VStack {
            AsyncImage(url: product.productImageName) { image in
                image
                    .resizable ()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .scaledToFit()
            .frame(width: 250)
            .clipShape(.rect(cornerRadius: 20))
            
            HStack{
                VStack(alignment: .leading, spacing: 5) {
                    Text("$\(product.cost)")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(product.title)
                        .font(.title3)
                }
                Spacer()
            }
            .padding(.leading,40)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    MovieView(product: FetchService().products![1])
}
