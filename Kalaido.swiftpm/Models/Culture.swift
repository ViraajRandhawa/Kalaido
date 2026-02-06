//
//  Culture.swift
//  Kalaido
//
//  Created by Viraaj Randhawa on 22/01/26.
//

import Foundation

/// Represents a cultural category containing related stories
struct Culture: Identifiable, Hashable {
    let id: UUID
    let name: String
    let description: String
    let region: String
    let stories: [Story]
    
    init(id: UUID = UUID(), name: String, description: String, region: String, stories: [Story]) {
        self.id = id
        self.name = name
        self.description = description
        self.region = region
        self.stories = stories
    }
}

// MARK: - Translation Support (iOS 18+)

@available(iOS 18.0, *)
extension Culture {
    /// Target language for translation based on the culture
    var targetLanguage: Locale.Language {
        switch name {
        case "India":
            return .init(identifier: "hi") // Hindi
        case "Japan":
            return .init(identifier: "ja") // Japanese
        case "Italy":
            return .init(identifier: "it") // Italian
        case "Nigeria":
            return .init(identifier: "en") // English (fallback - Yoruba/Igbo/Hausa not supported)
        case "Mexico":
            return .init(identifier: "es") // Spanish
        case "Brazil":
            return .init(identifier: "pt") // Portuguese (Brazil)
        case "South Korea":
            return .init(identifier: "ko") // Korean
        case "Morocco":
            return .init(identifier: "ar") // Arabic
        case "France":
            return .init(identifier: "fr") // French
        case "China":
            return .init(identifier: "zh-Hans") // Chinese (Simplified)
        case "USA":
            return .init(identifier: "en") // English (US)
        case "Kenya":
            return .init(identifier: "en") // English (fallback - Swahili not supported)
        case "Peru":
            return .init(identifier: "es") // Spanish
        case "Spain":
            return .init(identifier: "es") // Spanish (Spain)
        case "Greece":
            return .init(identifier: "el") // Greek
        case "Turkey":
            return .init(identifier: "tr") // Turkish
        case "Thailand":
            return .init(identifier: "th") // Thai
        case "Egypt":
            return .init(identifier: "ar") // Arabic
        case "Australia":
            return .init(identifier: "en") // English (AU)
        case "Russia":
            return .init(identifier: "ru") // Russian
        default:
            return .init(identifier: "en") // Default to English
        }
    }
    
    /// Human-readable name of the target language for UI display
    var targetLanguageName: String {
        switch name {
        case "India": return "Hindi"
        case "Japan": return "Japanese"
        case "Italy": return "Italian"
        case "Nigeria": return "English"
        case "Mexico": return "Spanish"
        case "Brazil": return "Portuguese"
        case "South Korea": return "Korean"
        case "Morocco": return "Arabic"
        case "France": return "French"
        case "China": return "Chinese"
        case "USA": return "English"
        case "Kenya": return "English"
        case "Peru": return "Spanish"
        case "Spain": return "Spanish"
        case "Greece": return "Greek"
        case "Turkey": return "Turkish"
        case "Thailand": return "Thai"
        case "Egypt": return "Arabic"
        case "Australia": return "English"
        case "Russia": return "Russian"
        default: return "English"
        }
    }
}
