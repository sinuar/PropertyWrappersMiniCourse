//@AppStorage es un wrapper que almacena valores persistentes automáticamente.
//Cada valor se asocia con una clave (String) y persiste entre sesiones de la app.
//Cuándo usarlo:
//Cuando necesitas guardar configuraciones del usuario, como el nombre, tema, volumen, etc.

import SwiftUI

struct AppStorageExampleView: View {
    // Almacena el nombre en UserDefaults
    @AppStorage("username") private var username: String = "Invitado"
    @AppStorage("isPremium") private var isPremium: Bool = false
    
    var body: some View {
        Form {
            Section("Perfil") {
                TextField("Nombre de usuario", text: $username)
                Toggle("Premium", isOn: $isPremium)
            }
            
            Section("Vista previa") {
                Text("Hola, \(username)")
                if isPremium {
                    Label("Cuenta Premium", systemImage: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
        }
        .navigationTitle("AppStorage Example")
    }
}

#Preview {
    AppStorageExampleView()
}

//Aquí, los valores se guardan automáticamente en UserDefaults.
//Si cierras y vuelves a abrir la app, los valores se mantienen.
//Ideal para configuraciones y preferencias ligeras.
