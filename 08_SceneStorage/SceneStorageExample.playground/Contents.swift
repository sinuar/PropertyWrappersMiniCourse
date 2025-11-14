//Similar a @AppStorage, pero se usa para restaurar el estado de una vista si
//el usuario cambia de escena (por ejemplo, cambia de app y vuelve).
//Se usa cuando quieres que una vista recuerde su estado temporal,
//como el texto de un campo o una pestaña activa.

import SwiftUI

struct SceneStorageExampleView: View {
    @SceneStorage("draftText") private var draft: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Redacta un mensaje (se guardará automáticamente):")
            TextEditor(text: $draft)
                .frame(height: 150)
                .border(Color.gray)
            
            Text("Borrador actual: \(draft)")
                .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle("SceneStorage")
    }
}

#Preview {
    SceneStorageExampleView()
}

// Si cambias de app y regresas, el texto sigue ahí.
// Pero si cierras completamente la app, se pierde (no es persistente, solo temporal).
