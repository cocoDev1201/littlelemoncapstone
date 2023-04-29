//
//  Onboarding.swift
//  littlelemon
//
//  Created by Emre Ülkem on 15.04.2023.
//

import SwiftUI

struct Onboarding: View {
    @StateObject private var viewModel = ViewModel()
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    
    @State var isKeyboardVisible = false
    @State var contentOffset: CGSize = .zero
    
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
            
            VStack {
                Header()
                Hero()
                    .padding()
                    .background(Color.primary.Color1)
                    .frame(maxWidth: .infinity, maxHeight: 240)
                }
            
            VStack {
                NavigationLink("Home", destination: Home(), isActive: $isLoggedIn) { }
                Text("First name *")
                    .onboardingTextStyle()
                TextField("First Name", text: $firstName)
                Text("Last name *")
                    .onboardingTextStyle()
                TextField("Last Name", text: $lastName)
                Text("E-mail *")
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                }
            .textFieldStyle(.roundedBorder)
            .disabledAutocorrection(true)
            .padding()
                
                if viewModel.errorMessageShow {
                    withAnimation() {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                    }
                }
            
                Button("Register") {
                    if viewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email) {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        firstName = ""
                        lastName = ""
                        email = ""
                        isLoggedIn = ""
                    }
                }
                .buttonStyle(ButtonStyleYellowColorWide())
            
            Spacer()
        }
        .offset(y: contentOffset.height)
        .onReceive(NotificationCenter.default.publisher(for:UIResponder.keyboardWillShowNotification)) { notification in
            withAnimation {
                let keyboardRect = notification.UserInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                let keyboardHeight = keyboardRect.height
                self.isKeyboardVisible = true
                self.contentOffset = CGSize(width: 0, height: -keyboardHeight / 2 + 50)
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { notification in
            withAnimation {
                self.isKeyboardVisible = false
                self.contentOffset = .zero
            }
        }
    }
        .onAppear() {
            if UserDefaults.standar.bool(forKey: kIsLoggedIn) {
                isLoggedIn = true
        }
    }
}
        .navigationBarBackButtonHidden()
}
    
struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

