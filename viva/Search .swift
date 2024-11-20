//
//  Search .swift
//  viva
//
//  Created by Christine Lai on 11/20/24.
//

import Foundation
import SwiftUI

struct Search: View {
    
    // State variable for search text and local picks
    @State private var searchText = ""
    @State private var localPicks = ["Garden Cafe", "626 Hospitality Group"] // Sample local picks
    
    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                TextField("Search for the restaurants you love", text: $searchText)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                // Local Picks Section
                VStack(alignment: .leading) {
                    Text("Local Picks")
                        .font(.headline)
                        .padding(.top)
                        .padding(.leading)
                    
                    // Filtered list based on search text
                    List(filteredLocalPicks, id: \.self) { pick in
                        Button(action: {
                            print("\(pick) selected")
                            // Handle the action when a local pick is selected
                        }) {
                            Text(pick)
                                .padding()
                                .cornerRadius(8)
                        }
                    }
                }
                
                Spacer()
            }
            .navigationBarTitle("Where are you eating?", displayMode: .inline)
        }
    }
    
    // Computed property to filter local picks based on search text
    var filteredLocalPicks: [String] {
        if searchText.isEmpty {
            return localPicks
        } else {
            return localPicks.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
