//
//  NavigationCoordinator.swift
//  Kalaido
//
//  Created by Antigravity on 26/01/27.
//

import SwiftUI

/// Accessible routes for app navigation
enum Route: Hashable {
    case onboarding
    case chooseMoment
    case storyReader(Story)
    case reflection(Story)
    case settings
    
    // Custom Hashable implementation since Story might not be Hashable yet
    func hash(into hasher: inout Hasher) {
        switch self {
        case .onboarding:
            hasher.combine(0)
        case .chooseMoment:
            hasher.combine(1)
        case .storyReader(let story):
            hasher.combine(2)
            hasher.combine(story.title)
        case .reflection(let story):
            hasher.combine(3)
            hasher.combine(story.title)
        case .settings:
            hasher.combine(4)
        }
    }
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case (.onboarding, .onboarding):
            return true
        case (.chooseMoment, .chooseMoment):
            return true
        case (.storyReader(let lStory), .storyReader(let rStory)):
            return lStory.title == rStory.title
        case (.reflection(let lStory), .reflection(let rStory)):
            return lStory.title == rStory.title
        case (.settings, .settings):
            return true
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
    
    /// Pops back to the ChooseMomentView (Dashboard)
    ///
    /// Assumes the stack is [onboarding..., chooseMoment, storyReader..., reflection]
    /// We want to remove everything after chooseMoment.
    func popToChooseMoment() {
        // Since we can't easily introspect NavigationPath for exact types without keeping a separate array,
        // and our flow is linear: Welcome -> Onboarding -> ChooseMoment -> Story...
        // We can just reset to root if ChooseMoment was root?
        // Wait, Welcome is root.
        // Current stack: [Onboarding, ChooseMoment, StoryReader, Reflection]
        // We want: [Onboarding, ChooseMoment]
        
        // Simpler approach for now: Pop until we are back.
        // But NavigationPath doesn't support "pop until".
        // Better architecture: Keep a parallel array of routes we can manipulate.
        // Or, simple hack: pop(count).
        // Let's implement popToRoot() for "Read Another Story" which is effectively what we want
        // IF we redesign to make ChooseMoment the "effective" root for that loop.
        
        // Actually, if we want "Read Another Story" to go to ChooseMoment,
        // and our stack is [Onboarding, ChooseMoment, Story, Reflection],
        // we want to pop 2 levels.
        // But the user might be 10 levels deep if we allowed drilling down.
        // Given constraints, let's just use popToRoot() provided Welcome isn't the root of the *path*.
        // Wait, WelcomeView HOLDS the NavigationStack. So Welcome is technically NOT in the path.
        // The path starts empty.
        // 1. push(.onboarding) -> Path: [.onboarding]
        // 2. push(.chooseMoment) -> Path: [.onboarding, .chooseMoment]
        // 3. push(.story) -> Path: [.onboarding, .chooseMoment, .story]
        
        // So validation:
        // popToRoot() => Path: []. Result: User sees WelcomeView. That is WRONG.
        // We want to go back to .chooseMoment.
        
        // We need to rebuild the path to be [.onboarding, .chooseMoment]
        path = NavigationPath()
        path.append(Route.onboarding)
        path.append(Route.chooseMoment)
    }
}
