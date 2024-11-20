//
//  Onboarding .swift
//  viva
//
//  Created by Christine Lai on 11/20/24.
//

import Foundation
import SwiftUI

struct Onboarding: View {
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination:Search()
                                .transition(.move(edge: .bottom))) {
                    Image("Onboarding")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                }
            }
            .navigationBarHidden(true)
        }
        .animation(.easeInOut, value: true)
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    ContentView()
}
