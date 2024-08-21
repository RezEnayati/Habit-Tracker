//
//  AddView.swift
//  HabitTracker
//
//  Created by Reza Enayati on 8/21/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var description = ""
    @State private var emoji = ""
    
    var activities: Activities
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Add a name for the Activity: ") {
                    TextField("Name", text: $name)
                }
                Section("Add a description for the Activity: ") {
                    TextField("Description: ", text: $description)
                }
                Section("Add an emoji for the Activity: ") {
                    TextField("Emoji: ", text: $emoji)
                        .textContentType(.nickname)
                }
            }
            
            .navigationTitle("Add New Acitivity")
            .toolbar {
                Button("Add") {
                    let activity = Activity(name: name, description: description, emoji: emoji)
                    activities.activities.append(activity)
                    dismiss()
                }
            }
        }
        
    }
}

#Preview {
    let activities = Activities()
    return AddView(activities: activities)
        .preferredColorScheme(.dark)
}
