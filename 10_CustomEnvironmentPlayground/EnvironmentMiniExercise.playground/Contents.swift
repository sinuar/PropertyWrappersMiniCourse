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
