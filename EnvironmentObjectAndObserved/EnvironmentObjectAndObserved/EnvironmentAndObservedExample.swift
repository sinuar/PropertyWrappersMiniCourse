//
//  ContentView.swift
//  EnvironmentObjectAndObserved
//
//  Created by Sinuhe Alvarez Ruedas on 13/11/25.
//

import SwiftUI

// 🌍 Modelo global

class UserSettings: ObservableObject {
    var username: String = "Andres"
    var prefersDarkMode: Bool = false
}

// ⚙️ ViewModel local
class FormPreferencesViewModel: ObservableObject {
    @Published var tempUsername: String = ""
    @Published var tempDarkMode: Bool = false
    
    // Sincroniza valores iniciales desde el global
    func load(from settings: UserSettings) {
        // TODO: asigna los valores iniciales del global al local
        tempUsername = settings.username
        tempDarkMode = settings.prefersDarkMode
    }
    
    // Guarda los cambios en el global
    func apply(to settings: UserSettings) {
        // TODO: copia los valores locales al global
        settings.username = tempUsername
        settings.prefersDarkMode = tempDarkMode
    }
}

// 🧩 Vista principal
struct EnvironmentAndObservedExample: View {
    @EnvironmentObject var userSettings: UserSettings
    @StateObject private var formVM = FormPreferencesViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Perfil actual") {
                    Text("👤 \(userSettings.username)")
                    Toggle("Modo oscuro", isOn: $userSettings.prefersDarkMode)
                }
                
                Section("Editar preferencias") {
                    TextField("Nuevo nombre", text: $formVM.tempUsername)
                    Toggle("Modo oscuro", isOn: $formVM.tempDarkMode)
                }
            }
            .navigationTitle("Ajustes de Usuario")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Guardar") {
                        // TODO: Aplica los cambios al EnvironmentObject
                        formVM.apply(to: userSettings)
                    }
                }
            }
            .onAppear {
                // TODO: Carga los valores iniciales
                formVM.load(from: userSettings)
            }
        }
    }
}

#Preview {
    EnvironmentAndObservedExample()
        .environmentObject(UserSettings())
}

