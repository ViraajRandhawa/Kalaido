//
//  Story.swift
//  Kalaido
//
//  Model representing a cultural story
//

import SwiftUI

/// Represents a cultural story with its content and metadata
struct Story: Codable, Hashable, Identifiable {
    var id: UUID = UUID()
    let title: String
    let country: String
    let paragraphs: [String]
    let images: [String] // SF Symbol names
    let storableGradient: [StorableColor]
    let culturalContext: String
    
    /// Computed colors from storable format
    var colors: [Color] {
        storableGradient.map { $0.color }
    }
    
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
struct StorableColor: Codable, Hashable {
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

