//
//  DetailView.swift
//  HabitTracker
//
//  Created by Reza Enayati on 8/21/24.
//

import SwiftUI

struct DetailView: View {
    let activities: Activities
    @State var activity: Activity
    
    var devider: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.white)
            .padding(.horizontal)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text(activity.emoji)
                    .font(.system(size: 150))
                    .padding()
                
                devider.padding(.horizontal)
                    
                Text(activity.name.capitalizeFirst)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                devider
                
                Text(activity.description)
                    .foregroundStyle(.white)
                    .padding()
                
                devider
                
                Text("Days Completed: \(activity.count)")
                    .foregroundStyle(.white)
                    .padding()
                
                devider
                
                Button {
                    let oldActivity = activity
                    let newActivity = Activity(name: activity.name, description: activity.description, count: activity.count + 1, emoji: activity.emoji)
                    activity = newActivity
                    if let index = activities.activities.firstIndex(of: oldActivity) {
                        
                        activities.activities[index] = newActivity
                    }
                } label : {
                        RoundedRectangle(cornerRadius: 10)
                        .frame(height: 60)
                        .padding()
                        .overlay {
                            Text("Completed this task today!")
                                .foregroundStyle(.white)
                                .font(.headline)
                        }
                        .shadow(radius: 10)
                }
                    
            }
            
            .navigationTitle("Activity Details")
        }
        
        .background(.backGroundGradient)
        
    }
}

#Preview {
    let activity = Activity(name: "Test", description: "Test", emoji: "🚀")
    let activities = Activities()
    return DetailView(activities: activities, activity: activity)
}
