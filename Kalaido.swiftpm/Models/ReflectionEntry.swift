//
//  ReflectionEntry.swift
//  Kalaido
//
//  Model representing a saved reflection
//

import SwiftUI

/// Represents a user's reflection after reading a story
struct ReflectionEntry: Identifiable, Codable {
    let id: UUID
    let date: Date
    let storyTitle: String
    let storyCountry: String
    let feelings: [String]
    let notes: String
    let gradientColors: [StorableColor]
    
    /// Reconstructs the gradient for display
    var gradient: [Color] {
        gradientColors.map { $0.color }
    }
    
    /// Creates a horizontal linear gradient from stored colors
    var linearGradient: LinearGradient {
        KalaidoTheme.horizontalGradient(gradient)
    }
}
