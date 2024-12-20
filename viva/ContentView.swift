//
//  ContentView.swift
//  viva
//
//  Created by Christine Lai on 11/19/24.
//

//
//  ContentView.swift
//  viva
//
//  Created by Christine Lai on 11/19/24.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: Onboarding()
                                .transition(.move(edge: .bottom))) {
                    Image("Launch")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                }
            }
            .navigationBarHidden(true)
        }
        .animation(.easeInOut, value: true)
    }
}

#Preview {
    ContentView()
}
