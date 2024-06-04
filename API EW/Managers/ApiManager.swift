//
//  File.swift
//  API EW
//
//  Created by Shreyas Veturi on 04/06/2024.
//

import Foundation

class ApiManager: ObservableObject {
    
    static let shared = ApiManager()
    
    private init() {}
    
    private let baseURL = "https://deckofcardsapi.com/api/deck/"
    
    func shuffleDeck(completion: @escaping ([ApiShuffleResult]) -> Void) {
        let query = "new/shuffle/?deck_count=1"
        
        guard let url = URL(string: baseURL + query) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            let decoder = JSONDecoder()
                        
                    guard let data = data,
                            let result = try? decoder.decode([ApiShuffleResult].self, from: data) else {
                        print("Error decoding")
                        return
                    }
                        
                    completion(result)
                }
                task.resume()
            }
}
