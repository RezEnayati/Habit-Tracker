//
//  Color-Theme.swift
//  HabitTracker
//
//  Created by Reza Enayati on 8/21/24.
//

import Foundation
import SwiftUI

extension ShapeStyle where Self == Color {
    
    static var backGroundGradient: LinearGradient {
        LinearGradient(colors: [.black, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    static var babyBlue: Color {
        Color(red: 137/255, green: 207/255, blue: 240/255)
    }
}

extension String {
    var  capitalizeFirst: String {
        guard let firtLetter = self.first else {return self}
        return firtLetter.uppercased() + self.dropFirst()
    }
}
