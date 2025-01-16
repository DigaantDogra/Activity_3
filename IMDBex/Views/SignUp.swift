//
//  SignUp.swift
//  IMDBex
//
//  Created by Digaant Dogra on 2025-01-09.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct SignUp: View {
    @StateObject var vm = SIgnInViewModel()
    @Binding var login:Bool
    @State var userName = ""
    @State var password = ""
    var body: some View {
        VStack{
            Spacer()
            GroupBox{
                Text("Create Account")
                    .font(.custom("Heading", size: 35))
                    .padding()
                    .padding(.bottom,15)
                
                GroupBox{
                    TextField("First Name", text: $userName)
                        .font(.title3)
                        .padding(.top,15)
                        .padding(.leading,10)
                    TextField("Email", text: $userName)
                        .font(.title3)
                        .padding(.top,15)
                        .padding(.leading,10)
                    SecureField("Password", text: $password)
                        .font(.title3)
                        .padding(.top,15)
                        .padding(.leading,10)
                }
                
                Button{
                    // auth and then go the movie
                }label: {
                    Text("Sign-up")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .padding()
                        .background(.yellow.opacity(0.7))
                        .containerShape(.capsule)
                }
                
                GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .wide, state: .normal)){
                    Task{
                        try await vm.signInGoogle()
                    }
                }// we can change the button
                
                Button{
                    login.toggle()
                }label: {
                    Text("I have an Account")
                }
                .padding(.top, 10)
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    SignUp(login: .constant(false))
}
