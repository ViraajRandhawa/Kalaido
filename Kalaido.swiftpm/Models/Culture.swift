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
