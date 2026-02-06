//
//  StoryData.swift
//  Kalaido
//

import SwiftUI

/// Central repository for all cultural stories
///
/// **Architecture Note:**
/// Now uses static compile-time data from `CultureData` instead of JSON.
enum StoryData {
    
    /// All available cultures
    static let cultures: [Culture] = CultureData.allCultures
    
    /// Flattened list of all stories for legacy support or global search
    static var allStories: [Story] {
        cultures.flatMap { $0.stories }
    }
    
    // Convenience accessors for previews
    static var celebrationStory: Story { allStories.first(where: { $0.title == "Celebration" }) ?? allStories[0] }
    static var respectStory: Story { allStories.first(where: { $0.title == "Respect & Social Boundaries" }) ?? allStories[0] }
}
