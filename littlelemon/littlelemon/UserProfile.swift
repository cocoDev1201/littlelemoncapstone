//
//  UserProfile.swift
//  littlelemon
//
//  Created by Emre Ülkem on 15.04.2023.
//

import SwiftUI

struct UserProfile: View {
    
    @Environment(\.presentationMode) var presentation
    
    let firstNameH = UserDefaults.standard.string(forKey: "first name key")!
    let lastNameH = UserDefaults.standard.string(forKey: "last name key")!
    let emailH = UserDefaults.standard.string(forKey: "email key")!
    
    var body: some View {
        VStack {
            Text("Personal information")
            Image("profile")
                .resizable()
                .scaledToFit()
            Text(firstNameH)
            Text(lastNameH)
            Text(emailH)
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: "kIsLoggedIn")
                self.presentation.wrappedValue.dismiss()
            }
            Spacer()
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}

