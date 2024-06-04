//
//  ContentView.swift
//  API EW
//
//  Created by Shreyas Veturi on 04/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var shuffle: Bool = false
    @State private var result: [ApiShuffleResult] = []
    
    @ObservedObject var apiManager = ApiManager.shared
    
    var body: some View {
        VStack {
            Button("Shuffle Deck") {
                shuffle.toggle()
            }
            if shuffle == true {
                apiManager.shuffleDeck { result in
                    self.result = result
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
