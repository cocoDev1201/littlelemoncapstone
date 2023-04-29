//
//  Home.swift
//  littlelemon
//
//  Created by Emre Ülkem on 15.04.2023.
//

import SwiftUI
import CoreData

struct Home: View {
    
    let persistence = PersistenceController.shared
    
    
    var body: some View {
        TabView {
            Menu()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            UserProfile()
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
        }
        .environment(\.managedObjectContext, persistence.container.viewContext)
        .navigationBarBackButtonHidden(true) 
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

