// @FetchRequest es un wrapper que conecta Core Data con SwiftUI y mantiene
// sincronizados los resultados de una consulta (FetchRequest).
// Se usa cuando usas Core Data para almacenamiento local y quieres mostrar
// resultados reactivos en una vista.

import SwiftUI
import CoreData

struct FetchRequestExampleView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default
    )
    private var items: FetchedResults<Item>
    
    @Environment(\.managedObjectContext) private var context
    
    var body: some View {
        List {
            ForEach(items) { item in
                Text(item.timestamp!, style: .time)
            }
            .onDelete(perform: deleteItems)
        }
        .navigationTitle("FetchRequest Example")
        .toolbar {
            Button("Add Item") {
                addItem()
            }
        }
    }
    
    private func addItem() {
        let newItem = Item(context: context)
        newItem.timestamp = Date()
        try? context.save()
    }
    
    private func deleteItems(at offsets: IndexSet) {
        offsets.map { items[$0] }.forEach(context.delete)
        try? context.save()
    }
}


// Aquí @FetchRequest se actualiza automáticamente si agregas, borras o
// modificas registros en Core Data.
// Ideal para listas y dashboards de datos locales.
