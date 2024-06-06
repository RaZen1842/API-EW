//
//  ContentView.swift
//  API EW
//
//  Created by Shreyas Veturi on 04/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var shuffle: Bool = true
    @State private var result: ApiShuffleResult?
    
    @ObservedObject var apiManager = ApiManager.shared
    
    var body: some View {
        VStack {
            Button("Shuffle Deck") {
                
                if shuffle == true {
                    apiManager.shuffleDeck { result in
                        DispatchQueue.main.async {
                            self.result = result
                        }
                    }
                }
            }
            
            if let result = result {
                Text("Deck ID: \(result.deck_id)")
                Text("Shuffled: \(result.shuffled ? "Yes" : "No")")
                Text("Remaining: \(result.remaining)")
            } else {
                Text("No result")
            }
        }
    }
}

#Preview {
    ContentView()
}
