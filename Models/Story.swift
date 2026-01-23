//
//  Story.swift
//  Kalaido
//
//  Model representing a cultural story
//

import SwiftUI

/// Represents a cultural story with its content and metadata
struct Story {
    let title: String
    let country: String
    let paragraphs: [String]
    let images: [String] // SF Symbol names
    let gradient: [Color]
    let culturalContext: String
    
    /// Icon name for the story card
    var icon: String {
        images.first ?? "book.fill"
    }
    
    /// Total number of pages in the story
    var pageCount: Int {
        paragraphs.count
    }
    
    /// Estimated reading time in minutes (based on ~200 words per minute)
    var readingTimeMinutes: Int {
        let totalWords = paragraphs.reduce(0) { $0 + $1.split(separator: " ").count }
        let minutes = max(1, Int(ceil(Double(totalWords) / 200.0)))
        return minutes
    }
    
    /// Formatted reading time string
    var readingTimeText: String {
        "\(readingTimeMinutes) min read"
    }
    
    /// Safe access to paragraph at index
    func paragraph(at index: Int) -> String {
        guard index >= 0 && index < paragraphs.count else {
            return ""
        }
        return paragraphs[index]
    }
    
    /// Safe access to image at index
    func image(at index: Int) -> String? {
        guard index >= 0 && index < images.count else {
            return nil
        }
        return images[index]
    }
}

// MARK: - Codable Support for Gradient Colors

/// Represents RGB color components for storage
struct StorableColor: Codable {
    let red: Double
    let green: Double
    let blue: Double
    
    var color: Color {
        Color(red: red, green: green, blue: blue)
    }
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
}

extension Story {
    /// Convert gradient colors to storable format
    var storableGradient: [StorableColor] {
        // Use predefined mappings based on story title
        switch title {
        case "Celebration":
            return [StorableColor(red: 0.95, green: 0.6, blue: 0.35),
                    StorableColor(red: 0.95, green: 0.5, blue: 0.65)]
        case "Respect & Social Boundaries":
            return [StorableColor(red: 0.6, green: 0.7, blue: 0.95),
                    StorableColor(red: 0.75, green: 0.65, blue: 0.9)]
        case "Food & Family":
            return [StorableColor(red: 0.95, green: 0.85, blue: 0.35),
                    StorableColor(red: 0.95, green: 0.7, blue: 0.45)]
        case "Growing Up":
            return [StorableColor(red: 0.4, green: 0.85, blue: 0.6),
                    StorableColor(red: 0.45, green: 0.8, blue: 0.8)]
        case "Loss & Remembrance":
            return [StorableColor(red: 0.65, green: 0.45, blue: 0.85),
                    StorableColor(red: 0.9, green: 0.5, blue: 0.65)]
        case "Community & Joy":
            return [StorableColor(red: 0.2, green: 0.75, blue: 0.4),
                    StorableColor(red: 0.95, green: 0.85, blue: 0.2)]
        case "Honoring Elders":
            return [StorableColor(red: 0.85, green: 0.3, blue: 0.35),
                    StorableColor(red: 0.95, green: 0.55, blue: 0.5)]
        case "The Art of Hospitality":
            return [StorableColor(red: 0.85, green: 0.5, blue: 0.2),
                    StorableColor(red: 0.75, green: 0.35, blue: 0.25)]
        default:
            return [StorableColor(red: 0.95, green: 0.6, blue: 0.35),
                    StorableColor(red: 0.95, green: 0.5, blue: 0.65)]
        }
    }
}
