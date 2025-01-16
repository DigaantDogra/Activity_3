//
//  StartTab.swift
//  IMDBex
//
//  Created by Digaant Dogra on 2025-01-13.
//

import SwiftUI

struct LoginSignupTab: View {
    @State private var login = true
    var body: some View {
        if login{
                Login(login: $login)
        }else{
            SignUp(login: $login)
        }
    }
}

#Preview {
    LoginSignupTab()
}
