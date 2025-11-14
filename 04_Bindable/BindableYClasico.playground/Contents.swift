import SwiftUI

// @Observable y @Bindable
// Cuando quieres menos código, sin @Published, sin boilerplate
// Cuando no necesitas compatibilidad con SwiftUI < iOS 17
// Para apps nuevas → modelo recomendado por Apple

@Observable
class Settings {
    var username: String = "Andres"
    var notificationsEnabled: Bool = true
    var themeColor: Color = .blue
}

struct BindableExampleView: View {
    // @Bindable: permite modificar el objeto observable desde la vista
    @Bindable var settings: Settings
    
    var body: some View {
        Form {
            // Binding directo a properties gracias a @Bindable
            TextField("Username", text: $settings.username)
            Toggle("Notifications", isOn: $settings.notificationsEnabled)
            ColorPicker("Theme Color", selection: $settings.themeColor)
        }
        HStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(settings.themeColor)
                .frame(height: 48)
                .padding(.vertical)
        }
    }
}

// MODELO CLASICO: ObservableObject + @Published

/*
class UserViewModel: ObservableObject {
    @Published var name: String = "Andres"
    @Published var age: Int = 25
}

struct ClassicObservableObjectView: View {
    // @StateObject: la vista crea y mantiene el ViewModel
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Name: \(viewModel.name)")
            Text("Age: \(viewModel.age)")
            
            Button("Increase Age") {
                viewModel.age += 1
            }
        }
        .padding()
    }
}

#Preview {
    ClassicObservableObjectView()
}
*/

 // CORREGIDO A VERSION NUEVA
 
 @Observable
 class UserViewModel {
     var name: String = "Andres"
     var age: Int = 25
     var isPremium: Bool = false
 }

 struct ObservableUserView: View {
     @Bindable var viewModel: UserViewModel
     
     var body: some View {
         VStack(spacing: 12) {
             TextField("Name", text: $viewModel.name)
             
             Stepper("Age \(viewModel.age)", value: $viewModel.age)
             
             Toggle("Premium", isOn: $viewModel.isPremium)
                 .padding(.horizontal)
             Text(viewModel.name)
                 .font(.title2.bold())
                 .foregroundColor(viewModel.isPremium ? .yellow : .primary)
                 .padding(.top)
             
             Button("Increase Age") {
                 viewModel.age += 1
             }
         }
         .padding()
     }
 }
 
// #Preview {
//     ObservableUserView(viewModel: UserViewModel())
// }
 

#Preview {
    // Creamos la instancia del modelo y la pasamos a la vista
    BindableExampleView(settings: Settings())
}
