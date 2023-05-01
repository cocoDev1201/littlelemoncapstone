//
//  ViewModel.swift
//  littlelemon
//
//  Created by Emre Ülkem on 29.04.2023.
//

import Foundation
import Combine

public let kFirstName = "first name key"
public let kLastName = "last name key"
public let kEmail = "e-mail key"
public let kIsLoggedIn = "kIsLoggedIn"

public let kOrderStatus = "order statuses key"
public let kPasswordChanges = "password changes key"
public let kSpecialOffers = "special offers key"
public let kNewsletter = "news letter key"

class ViewModel: ObservableObject {
    
    @Published var firsName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @Published var lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @Published var email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    
    @Published var orderStatutes = UserDefaults.standard.bool(forKey: kOrderStatus)
    @Published var passwordChanges = UserDefaults.standard.bool(forKey: kPasswordChanges)
    @Published var specialOffer = UserDefaults.standard.bool(forKey: kSpecialOffers)
    @Published var newsletter = UserDefaults.standard.bool(forKey: kNewsletter)
    
    
    @Published var errorMessageShow = false
    @Published var errorMessage = ""
    
    @Published var searchText = ""
    
    func validateUserInput(firstName: String, lastName: String, email: String) -> Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            errorMessage = "All fields are required."
            errorMessageShow = true
            return false
        }
        
        guard email.contains("@") else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        
        let email = email.split(separator: "@")
        
        guard email.count == 2 else {
            errorMessage = "Invalid email address"
            errorMessageShow = true
            return false
        }
        
        guard email[1].contains(".") else {
                errorMessage = "Invalid email address"
                errorMessageShow = true
                return false
        }
        
        errorMessageShow = false
        errorMessage = ""
        return true
    }
}
