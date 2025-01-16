//
//  Login.swift
//  IMDBex
//
//  Created by Digaant Dogra on 2025-01-09.
//

import SwiftUI

struct Login: View {
    @State private var isLoggedIn = false
    @Binding var login:Bool
    @State var userName = ""
    @State var password = ""
    var body: some View {
        VStack{
            Spacer()
            Image("chatting")
                .resizable()
                .scaledToFit()
                .frame(height: 260)
            
            Text("Login")
                .font(.custom("Heading", size: 35))
                .padding(5)
            
            GroupBox{
                TextField("Email", text: $userName)
                    .font(.title3)
                    .padding(.top,15)
                    .padding(.leading,10)
                SecureField("Password", text: $password)
                    .font(.title3)
                    .padding(.top,15)
                    .padding(.leading,10)
            }
            .padding()
            
            Button{
                // auth and then go the movie
            }label: {
                Text("Log-in")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .padding()
                    .padding([.leading,.trailing],40)
                    .background(.yellow.opacity(0.7))
                    .containerShape(.capsule)
            }
            
            HStack{
                Text("Dont have and account?")
                Button{
                    login.toggle()
                }label:{
                    Text("Create Account")
                }
            }
            .padding(.top, 10)
            
            HStack{
                Text("-----")
                Text("or")
                Text("-----")
            }
            .opacity(0.4)
            
            HStack{
                Button{
                    
                }label:{
                    Image("google3")
                        .frame(height: 30)
                        .padding()
                        .padding([.leading,.trailing],30)
                        .background(.yellow.opacity(0.7))
                        .containerShape(.capsule)
                }
            }
                
            Spacer()
        }
    }
}

#Preview {
    Login(login: .constant(true))
}
