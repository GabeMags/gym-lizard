//
//  Gym_LizardApp.swift
//  Gym Lizard
//
//  Created by Gabriel Magallanes on 9/4/23.
//

import SwiftUI

@main
struct Gym_LizardApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
