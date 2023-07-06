//
//  littlelemonApp.swift
//  littlelemon
//
//  Created by Emre Ülkem on 14.04.2023.
//

import SwiftUI

@main
struct lLemonApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Onboarding()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

