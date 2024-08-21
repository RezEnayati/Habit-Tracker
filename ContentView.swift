//
//  ContentView.swift
//  HabitTracker
//
//  Created by Reza Enayati on 8/20/24.
//

import SwiftUI

struct ContentView: View {
    @State private var activities = Activities()
    @State private var showingAddView = false
    @State private var isDeleting = false
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
        
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(activities.activities){activity in
                        let index = activities.activities.firstIndex(of: activity)
                        NavigationLink {
                            DetailView(activities: activities, activity: activity)
                        } label : {
                            ZStack(alignment: .topLeading) {
                                VStack {
                                    Text(activity.emoji)
                                        .font(.system(size: 100))
                                    VStack{
                                        Text(activity.name.capitalizeFirst)
                                            .foregroundStyle(.black)
                                            .font(.headline)
                                        Text("Frequency: \(activity.count)")
                                            .foregroundStyle(.black.opacity(0.7))
                                    }
                                    .padding(.bottom)
                                    .frame(maxWidth: .infinity)
                                    .background(.white)
                                    
                                }
                                .clipShape(.rect(cornerRadius: 10))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.white)
                                }
                                
                                if isDeleting {
                                    Button {
                                        removeActivity(at: index!)
                                        withAnimation {
                                            isDeleting.toggle()
                                        }
                                        
                                    } label : {
                                        Image(systemName: "xmark.circle.fill")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .foregroundStyle(.gray)
                                    }
                                    .offset(x: -11, y: -11)
                                }
                            
                            }
                            .padding()
                        }
                    }
                    
                }
                
            }
            .background(.backGroundGradient)
            .navigationTitle("Habit Tracker")
            .preferredColorScheme(.dark)
            .toolbar {
                Button{
                    showingAddView.toggle()
                } label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.white)
                }
                Button {
                    isDeleting.toggle()
                } label: {
                    Text("Edit")
                        .foregroundStyle(.white)
                }
                
            }
        }
        .sheet(isPresented: $showingAddView, content: {
            AddView(activities: activities)
        })
        
    }
    
    func removeActivity(at index: Int) {
        activities.activities.remove(at: index)
    }

}

#Preview {
    ContentView()
}
