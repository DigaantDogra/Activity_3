//
//  SIgnInViewModel.swift
//  IMDBex
//
//  Created by Digaant Dogra on 2025-01-13.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth

class SIgnInViewModel: ObservableObject{
    func signInGoogle() async throws{
        guard let topVC = await Utilities.shared.topViewController() else{
            throw URLError(.cannotFindHost)
        }
        
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        guard let idToken = gidSignInResult.user.idToken?.tokenString else{
            throw URLError(.badURL)
        }
        let accessToken = gidSignInResult.user.accessToken.tokenString
        
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
        
        
        
    }
}
