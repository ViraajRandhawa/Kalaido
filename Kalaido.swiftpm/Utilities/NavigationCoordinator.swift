//
//  NavigationCoordinator.swift
//  Kalaido
//
//  Created by Antigravity on 26/01/27.
//

import SwiftUI

/// Accessible routes for app navigation
enum Route: Hashable {
    case chooseMoment
    case storyReader(Story)
    case reflection(Story)
    
    // Custom Hashable implementation since Story might not be Hashable yet
    func hash(into hasher: inout Hasher) {
        switch self {
        case .chooseMoment:
            hasher.combine(0)
        case .storyReader(let story):
            hasher.combine(1)
            hasher.combine(story.title)
        case .reflection(let story):
            hasher.combine(2)
            hasher.combine(story.title)
        }
    }
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case (.chooseMoment, .chooseMoment):
            return true
        case (.storyReader(let lStory), .storyReader(let rStory)):
            return lStory.title == rStory.title
        case (.reflection(let lStory), .reflection(let rStory)):
            return lStory.title == rStory.title
        default:
            return false
        }
    }
}

/// Manages navigation state and transitions for the app
class NavigationCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    /// Navigates to a specific route
    func push(_ route: Route) {
        path.append(route)
    }
    
    /// Navigates back one level
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    /// Returns to the root view
    func popToRoot() {
        path = NavigationPath()
    }
}
