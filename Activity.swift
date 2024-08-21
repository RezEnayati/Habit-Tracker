//
//  Activity.swift
//  HabitTracker
//
//  Created by Reza Enayati on 8/20/24.
//

import Foundation

struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    let name: String 
    let description: String
    var count = 0
    var emoji: String
}
