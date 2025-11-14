import SwiftUI

// MARK: - @StateObject

// @StateObject crea y conserva un objeto observable.
// Cuando la vista es dueña del objeto y quieres que sobreviva a
// recargas de la vista.
// Ideal para el punto de origen del estado.

//@StateObject se usa una sola vez en la jerarquía para ese objeto.
//Si recreas la vista, SwiftUI no pierde el objeto (no se reinicia el contador).
//Es como @State, pero para clases observables.

class CounterModel: ObservableObject {
    @Published var count = 0
}

struct StateObjectExample: View {
    // La vista crea y mantiene viva la instancia
    @StateObject private var counter = CounterModel()
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Count: \(counter.count)")
                .font(.title)
            Button("Increase") {
                counter.count += 1
            }
            Button("Reset") {
                counter.count = 0
            }
        }
        .padding()
    }
}

//#Preview {
//    StateObjectExample()
//}


// MARK: - @ObservedObject

// @ObservedObject - Observa un objeto externo, sin crearlo.
//Cuando la vista recibe el objeto de otra vista y solo lo observa.
//Si la vista desaparece, el objeto no se conserva (porque no es su dueño).

//@ObservedObject no crea el objeto, solo lo usa.
//Es ideal para pasar datos entre vistas.
//Si la vista padre destruye la subvista, no se pierde el estado (porque
//la raíz lo tiene).

struct ObservedObjectExample: View {
    // La vista recibe el objeto desde otra
    @ObservedObject var counter: CounterModel
    
    var body: some View {
        VStack {
            Text("Sub-view count: \(counter.count)")
            Button("Increase from Subview") {
                counter.count += 1
            }
        }
        .padding()
    }
}

//#Preview {
//    // Se pasa el mismo objeto para probar la relación
//    ObservedObjectExample(counter: CounterModel())
//}

// MARK: - @EnvironmentObject

// @EnvironmentObject — comparte un modelo globalmente
// Cuando quieres compartir un mismo objeto entre muchas vistas sin pasarlo
// manualmente.
// Ideal para temas, sesión de usuario, configuración global, etc.

// Cualquier vista descendiente puede acceder a settings sin parámetros.
// Si cambias username, todas las vistas que lo usen se actualizan.
// Es la forma moderna y limpia de compartir datos en toda la app.

class AppSettings: ObservableObject {
    @Published var username: String = "Andres"
}

struct EnvironmentRootView: View {
    @StateObject private var settings = AppSettings()
    
    var body: some View {
        NavigationStack {
            UserProfileView()
                .environmentObject(settings) // 🔹 Se inyecta aquí
        }
    }
}

struct UserProfileView: View {
    @EnvironmentObject var settings: AppSettings // 🔹 Acceso global
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Hello, \(settings.username)!")
            TextField("Change username", text: $settings.username)
                .textFieldStyle(.roundedBorder)
                .padding()
        }
    }
}

//#Preview {
//    EnvironmentRootView()
//}
