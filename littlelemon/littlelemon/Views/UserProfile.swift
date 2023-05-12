//
//  UserProfile.swift
//  littlelemon
//
//  Created by Emre Ülkem on 15.04.2023.
//

import SwiftUI

struct UserProfile: View {
    @StateObject private var viewModel = ViewModel()
    
    @Environment(\.presentationMode) var presentation
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    
    @State private var isLoggedOut = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            NavigationLink(destination: Onboarding(), isActive: $isLoggedOut) { }
            
            VStack(spacing: 5) {
                VStack {
                    Text("Personal information")
                        .onboardingTextStyle()
                    HStack(spacing: 0) {
                        Image("profile")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(maxHeight: 75)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Button("Change") { }
                            .buttonStyle(ButtonStylePrimaryColor1())
                        Button("Remove") { }
                            .buttonStyle(ButtonStylePrimaryColorReverse())
                        Spacer()
                    }
                }
                
                VStack {
                    Text("First name")
                        .onboardingTextStyle()
                    TextField("First Name", text: $firstName)
                }
                
                VStack {
                    Text("Lirst name")
                        .onboardingTextStyle()
                    TextField("Lirst Name", text: $lastName)
                }
                
                VStack {
                    Text("E-mail")
                        .onboardingTextStyle()
                    TextField("E-mail", text: $email)
                        .keyboardType(.emailAddress)
                }
                
            }
            .textFieldStyle(.roundedBorder)
            .disableAutocorrection(true)
            .padding()
            
            Button("Log out") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                UserDefaults.standard.set("", forKey: kFirstName)
                UserDefaults.standard.set("", forKey: kLastName)
                UserDefaults.standard.set("", forKey: kEmail)
                isLoggedOut = true
            }
            .buttonStyle(ButtonStyleYellowColorWide())
            Spacer(minLength: 20)
            
            HStack {
                Button("Discard Changes") {
                    firstName = viewModel.firstName
                    lastName = viewModel.lastName
                    email = viewModel.email
                    self.presentation.wrappedValue.dismiss()
                }
                .buttonStyle(ButtonStylePrimaryColorReverse())
                
                Button("Save Changes") {
                    if viewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email) {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        self.presentation.wrappedValue.dismiss()
                    }
                }
                .buttonStyle(ButtonStylePrimaryColor1())
            }
            if viewModel.errorMessageShow {
                withAnimation() {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                }
            }
            
        }
        .onAppear {
            firstName = viewModel.firstName
            lastName = viewModel.lastName
            email = viewModel.email
        }
        .navigationTitle(Text("Personal information"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}

