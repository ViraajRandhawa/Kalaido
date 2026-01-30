//
//  Theme.swift
//  Kalaido
//
//  Design system with centralized colors and styles
//

import SwiftUI

/// Kalaido Design System
///
/// **Design Intent: Light Mode Only**
/// This app intentionally uses a fixed light color palette to maintain
/// the warm, emotionally inviting aesthetic central to the storytelling
/// experience. The cream and earth tones create a consistent "reading by
/// candlelight" feel that would be lost in dark mode.
///
/// For accessibility, we rely on:
/// - High contrast ratios (WCAG AA compliant)
/// - Dynamic Type support
/// - VoiceOver optimization
enum KalaidoTheme {
    
    // MARK: - Colors
    enum Colors {
        /// Primary text color - warm dark brown
        static let textPrimary = Color(red: 0.2, green: 0.15, blue: 0.1)
        
        /// Secondary text color - medium brown
        static let textSecondary = Color(red: 0.4, green: 0.35, blue: 0.3)
        
        /// Tertiary text color - light brown
        static let textTertiary = Color(red: 0.5, green: 0.45, blue: 0.4)
        
        /// Primary background - warm cream
        static let backgroundPrimary = Color(red: 0.96, green: 0.94, blue: 0.92)
        
        /// Secondary background - lighter cream
        static let backgroundSecondary = Color(red: 0.98, green: 0.96, blue: 0.94)
        
        /// Card background
        static let cardBackground = Color.white
        
        /// Accent color - warm coral
        static let accent = Color(red: 0.85, green: 0.55, blue: 0.45)
        
        /// Border color
        static let border = Color(red: 0.8, green: 0.75, blue: 0.7)
        
        /// Muted icon color
        static let iconMuted = Color(red: 0.7, green: 0.65, blue: 0.6)
        
        /// Progress track color
        static let progressTrack = Color(red: 0.9, green: 0.88, blue: 0.86)
        
        /// Sidebar background
        static let sidebarBackground = Color(red: 0.98, green: 0.97, blue: 0.95)
        
        /// Image section background
        static let imageBackground = Color(red: 0.97, green: 0.96, blue: 0.95)
    }
    
    // MARK: - Gradients
    
    /// Main background gradient used throughout the app
    static var backgroundGradient: LinearGradient {
        LinearGradient(
            colors: [Colors.backgroundPrimary, Colors.backgroundSecondary],
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    /// Creates a horizontal gradient from the given colors
    static func horizontalGradient(_ colors: [Color]) -> LinearGradient {
        LinearGradient(
            colors: colors,
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    
    // MARK: - Typography
    enum Fonts {
        static func title() -> Font {
            .custom("Georgia", size: 48, relativeTo: .largeTitle)
        }
        
        static func heading() -> Font {
            .system(size: 36, weight: .regular, design: .serif)
        }
        
        static func subheading() -> Font {
            .system(size: 28, weight: .semibold)
        }
        
        static func body() -> Font {
            .custom("Georgia", size: 17, relativeTo: .body)
        }
        
        static func caption() -> Font {
            .system(size: 15, weight: .regular)
        }
    }
    
    // MARK: - Shadows
    enum Shadows {
        static let card = (color: Color.black.opacity(0.1), radius: CGFloat(8), x: CGFloat(0), y: CGFloat(4))
        static let button = (color: Color.black.opacity(0.15), radius: CGFloat(10), x: CGFloat(0), y: CGFloat(5))
        static let elevatedCard = (color: Color.black.opacity(0.15), radius: CGFloat(20), x: CGFloat(0), y: CGFloat(10))
    }
    
    // MARK: - Corner Radii
    enum CornerRadius {
        static let small: CGFloat = 12
        static let medium: CGFloat = 20
        static let large: CGFloat = 24
        static let pill: CGFloat = 25
    }
}
