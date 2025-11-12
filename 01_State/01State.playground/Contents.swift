import SwiftUI

struct StateExampleView: View {
    // @State: estado interno, solo para esta vista
    @State private var counter = 0
    @State private var isOn: Bool = false
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Counter: \(counter)")
                .font(.title)
            
            Button("Increment") {
                counter += 1 // Modificar el estado redibuja la vista
            }
            Button("Reset") {
                counter = 0 // 1. Agrega un botón "Reset" para reiniciar el contador a 0.
            }
            Toggle("Activo/Inactivo", isOn: $isOn) // Agrega un Toggle con un texto que muestre “Activo / Inactivo”.
        }
        .padding()
    }
}

#Preview {
    StateExampleView()
}
