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
    
    func shuffleDeck(completion: @escaping (ApiShuffleResult?) -> Void) {
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
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print("Response JSON: \(json)")
                
                let result = try decoder.decode(ApiShuffleResult.self, from: data)
                completion(result)
            } catch {
                print("Error decoding JSON: \(error)")
                print("Response data: \(String(data: data, encoding: .utf8) ?? "Unable to convert data to string")")
                completion(nil)
            }
        }
        task.resume()
    }
}
