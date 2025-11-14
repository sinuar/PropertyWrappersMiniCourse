//
//  Persistence.swift
//  CoreDataFetchExample
//
//  Created by Sinuhe Alvarez Ruedas on 13/11/25.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        let viewContext = controller.container.viewContext

        // Datos de ejemplo
        for i in 0..<5 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date().addingTimeInterval(Double(i) * -3600)
            newItem.title = "Ejemplo \(i)"
        }
        try? viewContext.save()
        return controller
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Model")
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Error al cargar Core Data: \(error), \(error.userInfo)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
