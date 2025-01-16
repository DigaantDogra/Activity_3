//
//  InitialView.swift
//  IMDBex
//
//  Created by Digaant Dogra on 2025-01-09.
//

import Foundation
import SwiftUICore
import SwiftUI

struct Home: View {
    private var vm = HomeViewModel()
    
    var body: some View {
        ZStack{
            NavigationView {
                switch vm.status {
                case .notStarted:
                    Text("Empty View")
                case .fetching:
                    Text("Progress View")
                case .success:
                    VStack{
                        List(vm.products ?? FetchService().products!) { product in
                            NavigationLink(destination: ProductDetail(product: product)) {
                                MovieView(product: product)
                            }
                        }
                        .navigationTitle("Market Place")
                        Spacer(minLength: 60)
                    }
                case .failed(let message):
                    Text("\(message)")
                }
            }
            .onAppear{
                Task{
                    await vm.getData()
                }
            }
            
            VStack{
                Spacer()
                Button{
                    // Your button action here
                }label: {
                    Text("Log-in")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            
            
        }
    }
}

#Preview {
    Home()
}
