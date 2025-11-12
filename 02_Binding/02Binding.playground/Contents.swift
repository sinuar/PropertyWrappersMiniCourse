import SwiftUI

struct ParentBindingExampleView: View {
    // @State: vive en el padre
    @State private var isOn = false
    
    var body: some View {
        VStack {
            ToggleChildView(isOn: $isOn) // Pasamos el binding con $
            AnotherChildView(isOn: $isOn) // 2. 3a vista con el mismo binding
            Text(isOn ? "The switch is ON" : "The switch is OFF")
        }
        .padding()
    }
}

struct ToggleChildView: View {
    // @Binding: referencia al @State del padre
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle("Enable Setting", isOn: $isOn)
        
        // 1. Nuevo botón que cambia el estado
        Button("Toggle State") {
            isOn.toggle() // Cambia entre true/false
        }
    }
}

// Crea una tercera vista que también reciba el mismo binding.
struct AnotherChildView: View {
    @Binding var isOn: Bool
    
    var body: some View {
        Text("Another child view: \(isOn)")
    }
}

#Preview {
    ParentBindingExampleView()
}
