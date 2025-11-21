// Environment personalizado. Cuando quieres compartir configuraciones
// globales, estilos, opciones, permisos, modos de la app, etc., sin usar
// singletons ni pasar parámetros entre vistas.

// Requiere 3 pasos obligatorios:

import SwiftUI

// 1 — Crear un EnvironmentKey.

private struct HighlightColorKey: EnvironmentKey {
    static let defaultValue: Color = .yellow
}

// 2 — Extender EnvironmentValues

extension EnvironmentValues {
    var highlightColor: Color {
        get { self[HighlightColorKey.self] }
        set { self[HighlightColorKey.self] = newValue }
    }
}

// 3 — Crear un modificador para asignar el valor

extension View {
    func highlightColor(_ color: Color) -> some View {
        environment(\.highlightColor, color)
    }
}
// Esto permite escribir: .highlightColor(.orange)

// MARK: - Ejemplo de uso.

struct HighlightedText: View {
    @Environment(\.highlightColor) private var highlight
    
    var text: String
    
    var body: some View {
        Text(text)
            .padding()
            .background(highlight.opacity(0.3))
            .cornerRadius(8)
    }
}

// Y desde la vista padre:

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            HighlightedText(text: "Default highlight")
            
            HighlightedText(text: "Custom highlight")
                .highlightColor(.pink)
        }
        .padding()
    }
}


