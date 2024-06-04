//
//  File.swift
//  API EW
//
//  Created by Shreyas Veturi on 04/06/2024.
//

import Foundation

struct ApiShuffleResult: Codable {
    let success: Bool
    let deck_id: String
    let shuffled: Bool
    let remaining: Int
}
