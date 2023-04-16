//
//  Onboarding.swift
//  littlelemon
//
//  Created by Emre Ülkem on 15.04.2023.
//

import SwiftUI

let kIsLoggedIn = "kIsLoggedIn"

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"

struct Onboarding: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("", destination: Menu(), isActive: $isLoggedIn)
                EmptyView()
                
                TextField(
                    "First Name",
                    text: $firstName
                )
                TextField(
                    "Last Name",
                    text: $lastName
                )
                TextField(
                    "Email",
                    text: $email
                )
                Button {
                    if firstName.isEmpty && lastName.isEmpty && email.isEmpty {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        print("problem")
                    } else {
                        print("not a problem")
                    }
                    isLoggedIn = true
                    print("Button tapped")
                } label: {
                    Text("Register")
                }
            }
            onAppear()
                                
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

