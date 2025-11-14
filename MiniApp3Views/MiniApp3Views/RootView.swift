//
//  ContentView.swift
//  MiniApp3Views
//
//  Created by Sinuhe Alvarez Ruedas on 12/11/25.
//
// INSTRUCCIONES:
// 1. Una vista raíz que use @StateObject para un modelo UserData.
// 2. Una segunda vista que reciba ese modelo con @ObservedObject.
// 3. Una tercera vista (como pantalla de perfil) que acceda con @EnvironmentObject.
// 👉 Haz que el usuario pueda cambiar su nombre y ver el cambio reflejado en todas las vistas.

import SwiftUI

// 1. Una vista raíz que use @StateObject para un modelo UserData.
class UserData: ObservableObject {
    @Published var name: String = "Andrés"
    @Published var isPremium: Bool = false
}

// MARK: - 1. Vista principal (dueña del estado)
struct RootView: View {
    @StateObject private var userData = UserData()
    
    var body: some View {
            NavigationStack {
                VStack(spacing: 16) {
                    Text("👋 Bienvenido, \(userData.name)!")
                        .font(.title2)
                
                    Group {
                        // Icono si el usuario es premium
                        if userData.isPremium {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        } else {
                            Text("No eres premium 😢")
                        }
                    }
                    Divider().padding(.vertical, 8)
                    
                    NavigationLink("Ir a ObservedView") {
                        ObservedView(userData: userData)
                    }
                    
                    NavigationLink("Ir a EnvironmentView") {
                        EnvironmentView()
                            .environmentObject(userData)
                    }
                }
                .padding()
                .navigationTitle("RootView")
            }
        }
    }

// MARK: - 2. Subvista con @ObservedObject
struct ObservedView: View {
    // La vista recibe el objeto desde otra
    @ObservedObject var userData: UserData
    
    var body: some View {
            VStack(spacing: 16) {
                Text("Hola desde ObservedView 👀")
                    .font(.headline)
                TextField("Cambia el nombre", text: $userData.name)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Text("Tu nombre actual es \(userData.name)")
                Toggle("Premium", isOn: $userData.isPremium)
                    .padding(.horizontal)
            }
            .padding()
            .navigationTitle("ObservedView")
        }
    }

// MARK: - 3. Subvista con EnvironmentObject
    
struct EnvironmentView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
            VStack(spacing: 16) {
                Text("🌍 Environment View")
                    .font(.headline)
                Text("Usuario: \(userData.name)")
                Text(userData.name)
                    .foregroundColor(userData.isPremium ? .yellow : .primary)
                TextField("Actualizar nombre", text: $userData.name)
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
            .padding()
            .navigationTitle("EnvironmentView")
        }
    }

#Preview {
    RootView()
}
