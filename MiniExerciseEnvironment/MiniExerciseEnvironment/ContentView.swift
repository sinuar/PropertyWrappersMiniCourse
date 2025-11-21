//
//  ContentView.swift
//  MiniExerciseEnvironment
//
//  Created by Sinuhe Alvarez Ruedas on 18/11/25.
//

import SwiftUI

// Crea un valor de @Environment que indique si la app está en modo ‘debug’
// y úsalo para mostrar un banner rojo en la parte superior.

// 1 — Crear un EnvironmentKey.
private struct DebugBannerKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

// 2 — Extender EnvironmentValues
extension EnvironmentValues {
    var isDebug: Bool {
        get { self[DebugBannerKey.self] }
        set { self[DebugBannerKey.self] = newValue }
    }
}

// 3 — Crear un modificador para asignar el valor
extension View {
    func debugBanner(_ enabled: Bool) -> some View {
        environment(\.isDebug, enabled)
    }
}

// 4. Crear un banner que use el environment
struct DebugBanner: View {
    @Environment(\.isDebug) var isDebug
    
    var body: some View {
        if isDebug {
            Text("Debug Mode")
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .padding()
                .background(Color.red.opacity(0.72))
        }
    }
}

// 5. Vista principal usando el valor
struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            DebugBanner()
            Text("Normal app content here")
            Button("Toggle Debug (example)") {
                // Aquí solo es un ejemplo. En un caso real
                // esto podría venir de Settings, RemoteConfig, etc.
            }
        }
        .padding()
        .debugBanner(true) // ← Activamos el modo debug
    }
}




#Preview {
    ContentView()
}
