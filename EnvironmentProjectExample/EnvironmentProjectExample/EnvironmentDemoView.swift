//
//  ContentView.swift
//  EnvironmentProjectExample
//
//  Created by Sinuhe Alvarez Ruedas on 14/11/25.
//

import SwiftUI

struct EnvironmentDemoView: View {
    // 1. Leer el estado de colorScheme
    @Environment(\.colorScheme) private var colorScheme
    
    // 2. Leer idioma del sistema
    @Environment(\.locale) private var locale
    
    // 3. Obtener el dismiss del sistema
    @Environment(\.dismiss) private var dismiss
    
    // 4. Saber si la app está activa o en background
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("ColorScheme: \(colorScheme == .dark ? "🌙 Oscuro" : "☀️ Claro")")
                .font(.title2)
            
            Text("Idioma: \(locale.identifier)")
            
            Button("Cerrar Vista") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .onChange(of: scenePhase) { oldPhase, newPhase in
            print("📱 ScenePhase cambió a:", newPhase)
        }
    }
}

