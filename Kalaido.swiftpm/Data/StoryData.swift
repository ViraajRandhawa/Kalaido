//
//  StoryData.swift
//  Kalaido
//

import SwiftUI

/// Central repository for all cultural stories
///
/// **Architecture Note:**
/// Stories are loaded from `stories.json` at app launch for easy content management.
/// This approach allows non-engineers to add/edit stories without touching code.
///
/// **Scaling Considerations:**
/// - Current implementation loads all stories into memory at launch
/// - For 8 stories (~200KB), this is appropriate
/// - If expanding to 100+ stories (>2MB), consider:
///   - Lazy loading stories on-demand
///   - Paginated story lists
///   - Local database (Core Data or SQLite)
///
/// **Future Improvements:**
/// - Story categories/tags for filtering
/// - Multi-language support (localized JSON files)
/// - Story difficulty ratings
enum StoryData {
    
    /// All available stories in the app, loaded from stories.json
    static let allStories: [Story] = loadStories()
    
    /// Loads stories from the bundled stories.json file
    private static func loadStories() -> [Story] {
        // Try to find the stories.json file in the bundle
        guard let url = Bundle.main.url(forResource: "stories", withExtension: "json") else {
            print("❌ ERROR: stories.json not found in app bundle")
            print("   This likely means the file wasn't added to the target")
            return createFallbackStories()
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedStories = try decoder.decode([Story].self, from: data)
            
            guard !decodedStories.isEmpty else {
                print("⚠️ WARNING: stories.json is empty")
                return createFallbackStories()
            }
            
            print("✅ Successfully loaded \(decodedStories.count) stories")
            return decodedStories
        } catch {
            print("❌ ERROR decoding stories.json: \(error.localizedDescription)")
            print("   Raw error: \(error)")
            return createFallbackStories()
        }
    }
    
    /// Provides a minimal fallback story if JSON loading fails
    private static func createFallbackStories() -> [Story] {
        return [
            Story(
                title: "Welcome to Kalaido",
                country: "Sample",
                paragraphs: ["Unable to load stories. Please check the app installation."],
                images: ["book.fill"],
                storableGradient: [
                    StorableColor(red: 0.95, green: 0.6, blue: 0.35),
                    StorableColor(red: 0.95, green: 0.5, blue: 0.65)
                ],
                culturalContext: "This is a fallback story displayed when content cannot be loaded."
            )
        ]
    }
    
    // Convenience accessors for previews
    static var celebrationStory: Story { allStories.first(where: { $0.title == "Celebration" }) ?? allStories[0] }
    static var respectStory: Story { allStories.first(where: { $0.title == "Respect & Social Boundaries" }) ?? allStories[0] }
}
