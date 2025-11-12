import SwiftUI

// Reemplaza muchos casos de ObservableObject + @Published

// - Convierte una clase en observable sin @Published
// - Funciona automáticamente con el prefijo $ para bindings
// - Se usa con @Bindable (que veremos en el próximo bloque)

// MODELO
@Observable
class Profile {
    // Propiedades observables sin necesidad de @Published
    var username: String = "Andres"
    var age: Int = 25
    var isPremium: Bool = false
}
    
// VISTA
struct ObservableExampleView: View {
    // Creamos una instancia local (aún no usamos @StateObject aquí)
    @State private var profile = Profile()
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Name: \(profile.username)")
            Text("Age: \(profile.age)")
            
            if profile.isPremium {
                Image(systemName: "crown.fill")
            } else {
                Image(systemName: "crown")
            } // 3. Icono Premium
    
            TextField("Usuario", text: Bindable(profile).username) // 1. Agrega un TextField que permita cambiar el username
            
            Button("Increase Age") {
                profile.age += 1 // Cambia y la vista se actualiza
            }
            Button("Random Age") {
                profile.age = Int.random(in: 18...50)
            } // 2. Botón para edad aleatoria entre 18–50
        }
        .padding()
    }
}

#Preview {
    ObservableExampleView()
}
