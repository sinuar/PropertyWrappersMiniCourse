//Permite acceder a valores proporcionados automáticamente por SwiftUI, como:
//- dismiss (para cerrar una vista)
//- colorScheme (modo claro/oscuro)
//- locale, scenePhase, accessibilityReduceMotion, etc.
// Se usa cuando necesitas interactuar con configuraciones o comportamientos del sistema sin pasarlas manualmente.

import SwiftUI

struct EnvironmentExampleView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Modo actual: \(colorScheme == .dark ? "🌙 Oscuro" : "☀️ Claro")")
                .font(.headline)
            
            Button("Cerrar vista") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    EnvironmentExampleView()
}

//@Environment(\.dismiss) obtiene una función del entorno que cierra la vista.
//@Environment(\.colorScheme) detecta el tema del sistema.
