//
//  CoreDataFetchExampleApp.swift
//  CoreDataFetchExample
//
//  Created by Sinuhe Alvarez Ruedas on 13/11/25.
//

import SwiftUI

@main
struct CoreDataFetchExampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            FetchRequestExampleView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
