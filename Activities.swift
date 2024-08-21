//
//  Activities.swift
//  HabitTracker
//
//  Created by Reza Enayati on 8/20/24.
//

import Foundation

@Observable
class Activities {
    var activities = [Activity]() {
        // This will constantly listen for change for the activites array and will save the data to USerDefaults
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.setValue(encoded, forKey: "activities")
            }
        }
    }
    private var genrationFunctionHasRan = false
    //Here we want to see if the data has anything already and if it has load it from the disk to to the activites array right when the class is initialized
    init() {
        if let savedActivites = UserDefaults.standard.data(forKey: "activities") {
            if let decodedActivities = try? JSONDecoder().decode([Activity].self, from: savedActivites) {
                activities = decodedActivities
                return
            }
        }
        // If there is nothing just give us the default actitvites will only run the first time.
        activities = generateDefaultActivities()
    }
    
    func generateDefaultActivities() -> [Activity] {
        return [
            Activity(name: "reading", description: "Read at least 20 pages of a book a day", count: 1, emoji: "📚"),
            Activity(name: "Exercise", description: "Exercise for at least 30 minutes a day", count: 1, emoji: "🏋🏻"),
            Activity(name: "Piano", description: "Play the piano for at least 20 minutes a day", count: 1, emoji: "🎹"),
            Activity(name: "Languauge", description: "Learn a new Languauge for at least 30 minutes a day", count: 1, emoji: "📓")
        ]
    }
}
