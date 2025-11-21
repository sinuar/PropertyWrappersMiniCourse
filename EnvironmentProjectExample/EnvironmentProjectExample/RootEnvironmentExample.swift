//
//  RootEnvironmentExample.swift
//  EnvironmentProjectExample
//
//  Created by Sinuhe Alvarez Ruedas on 14/11/25.
//

import SwiftUI

struct RootEnvironmentExample: View {
    @State private var showDemo = false
    
    var body: some View {
        VStack {
            Button("Abrir Demo @Environment") {
                showDemo = true
            }
            .sheet(isPresented: $showDemo) {
                EnvironmentDemoView()
            }
        }
    }
}

#Preview {
    RootEnvironmentExample()
}
