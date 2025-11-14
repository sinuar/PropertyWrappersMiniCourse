//
// FetchRequestExampleView.swift
//  CoreDataFetchExample
//
//  Created by Sinuhe Alvarez Ruedas on 13/11/25.
//

import SwiftUI
import CoreData

struct FetchRequestExampleView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: false)],
        animation: .default
    )
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    VStack(alignment: .leading) {
                        Text(item.title ?? "Sin título")
                            .font(.headline)
                        if let timestamp = item.timestamp {
                            Text(timestamp, style: .date)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Lista de Items")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addItem) {
                        Label("Agregar", systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
        }
    }

    private func addItem() {
        let newItem = Item(context: viewContext)
        newItem.timestamp = Date()
        newItem.title = "Nuevo item"
        try? viewContext.save()
    }

    private func deleteItems(offsets: IndexSet) {
        for index in offsets {
            viewContext.delete(items[index])
        }
        try? viewContext.save()
    }
}

#Preview {
    FetchRequestExampleView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
