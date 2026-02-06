//
//  ReflectionManager.swift
//  Kalaido
//
//  Manages saving and loading user reflections and story progress
//

import SwiftUI

/// Manages the persistence and retrieval of user reflections and completed stories
///
/// **Scaling Note:**
/// UserDefaults is appropriate for the student challenge scope (<100 reflections expected).
/// For production with 1000+ reflections:
/// - Migrate to file-based JSON storage or Core Data
/// - UserDefaults has ~4MB practical limit per app
/// - Each reflection is ~500 bytes, so ~8000 reflections before optimization is needed
@MainActor
class ReflectionManager: ObservableObject {
    @Published var reflections: [ReflectionEntry] = []
    @Published var completedStories: Set<String> = [] // Track completed story titles
    
    private let saveKey = "SavedReflections"
    private let progressKey = "CompletedStories"
    
    init() {
        loadReflections()
        loadProgress()
    }
    
    // MARK: - Story Progress
    
    /// Check if a story has been completed
    func isStoryCompleted(_ story: Story) -> Bool {
        completedStories.contains(story.title)
    }
    
    /// Mark a story as completed
    func markStoryCompleted(_ story: Story) {
        completedStories.insert(story.title)
        saveProgress()
    }
    
    /// Get the number of completed stories
    var completedCount: Int {
        completedStories.count
    }
    
    /// Get total available stories
    var totalStories: Int {
        StoryData.allStories.count
    }
    
    // MARK: - Reflections
    
    /// Saves a new reflection for a story
    /// - Parameters:
    ///   - story: The story that was read
    ///   - feelings: Set of feelings the user selected
    ///   - notes: Optional notes from the user
    func saveReflection(story: Story, feelings: Set<String>, notes: String) {
        // Also mark story as completed
        markStoryCompleted(story)
        
        let newEntry = ReflectionEntry(
            id: UUID(),
            date: Date(),
            storyTitle: story.title,
            storyCountry: story.country,
            feelings: Array(feelings),
            notes: notes,
            gradientColors: story.storableGradient
        )
        
        reflections.insert(newEntry, at: 0) // Newest first
        saveToDisk()
    }
    
    /// Deletes a reflection at the specified offsets
    func deleteReflections(at offsets: IndexSet) {
        reflections.remove(atOffsets: offsets)
        saveToDisk()
    }
    
    /// Clears all saved reflections
    func clearAllReflections() {
        reflections.removeAll()
        saveToDisk()
    }
    
    /// Resets all progress
    func resetProgress() {
        completedStories.removeAll()
        saveProgress()
    }
    
    // MARK: - Private Methods
    
    private func saveToDisk() {
        if let encoded = try? JSONEncoder().encode(reflections) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    private func loadReflections() {
        if let data = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([ReflectionEntry].self, from: data) {
            reflections = decoded
        }
    }
    
    private func saveProgress() {
        let array = Array(completedStories)
        UserDefaults.standard.set(array, forKey: progressKey)
    }
    
    private func loadProgress() {
        if let array = UserDefaults.standard.stringArray(forKey: progressKey) {
            completedStories = Set(array)
        }
    }
}
