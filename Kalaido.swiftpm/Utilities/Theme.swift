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
        // MARK: - Adaptive Helpers
        private static func adaptiveColor(light: Color, dark: Color) -> Color {
            Color(UIColor { traitCollection in
                // Check for High Contrast Override
                let highContrast = UserDefaults.standard.bool(forKey: "highContrastEnabled")
                let isDark = traitCollection.userInterfaceStyle == .dark
                
                if highContrast {
                    // In high contrast, we force black/white extremes or strictly higher contrast values
                    if isDark {
                        return UIColor(dark)
                    } else {
                         return UIColor(light)
                    }
                }
                
                return isDark ? UIColor(dark) : UIColor(light)
            })
        }
        
        // MARK: - Palette Definitions
        
        // Text
        /// Primary text color - Warm Dark Brown <-> Soft Cream
        static let textPrimary = adaptiveColor(
            light: Color(red: 0.2, green: 0.15, blue: 0.1),
            dark: Color(red: 0.95, green: 0.94, blue: 0.90)
        )
        
        /// Secondary text color - Medium Brown <-> Muted Cream
        static let textSecondary = adaptiveColor(
            light: Color(red: 0.4, green: 0.35, blue: 0.3),
            dark: Color(red: 0.85, green: 0.82, blue: 0.78)
        )
        
        /// Tertiary text color - Light Brown <-> Warm Gray
        static let textTertiary = adaptiveColor(
            light: Color(red: 0.5, green: 0.45, blue: 0.4),
            dark: Color(red: 0.70, green: 0.68, blue: 0.64)
        )
        
        // Backgrounds
        /// Primary background - Warm Cream <-> Warm Charcoal
        static let backgroundPrimary = adaptiveColor(
            light: Color(red: 0.96, green: 0.94, blue: 0.92),
            dark: Color(red: 0.15, green: 0.14, blue: 0.13)
        )
        
        /// Secondary background - Lighter Cream <-> Slightly Lighter Charcoal
        static let backgroundSecondary = adaptiveColor(
            light: Color(red: 0.98, green: 0.96, blue: 0.94),
            dark: Color(red: 0.18, green: 0.17, blue: 0.16)
        )
        
        /// Card background - White <-> Dark Cocoa
        static let cardBackground = adaptiveColor(
            light: Color.white,
            dark: Color(red: 0.22, green: 0.20, blue: 0.18)
        )
        
        /// Sidebar background - Muted Cream <-> Dark Sidebar
        static let sidebarBackground = adaptiveColor(
            light: Color(red: 0.98, green: 0.97, blue: 0.95),
            dark: Color(red: 0.13, green: 0.12, blue: 0.11)
        )
        
        /// Image section background
        static let imageBackground = adaptiveColor(
            light: Color(red: 0.97, green: 0.96, blue: 0.95),
            dark: Color(red: 0.16, green: 0.15, blue: 0.14)
        )
        
        // Accents & Functional
        
        /// Accent color - Warm Coral (Maintained as it usually works well on both, or slightly tweaked)
        static let accent = adaptiveColor(
            light: Color(red: 0.85, green: 0.55, blue: 0.45),
            dark: Color(red: 0.90, green: 0.60, blue: 0.50) // Slightly brighter for dark mode
        )
        
        /// Border color
        static let border = adaptiveColor(
            light: Color(red: 0.8, green: 0.75, blue: 0.7),
            dark: Color(red: 0.35, green: 0.33, blue: 0.30)
        )
        
        /// Muted icon color
        static let iconMuted = adaptiveColor(
            light: Color(red: 0.7, green: 0.65, blue: 0.6),
            dark: Color(red: 0.5, green: 0.48, blue: 0.45)
        )
        
        /// Progress track color
        static let progressTrack = adaptiveColor(
            light: Color(red: 0.9, green: 0.88, blue: 0.86),
            dark: Color(red: 0.25, green: 0.23, blue: 0.21)
        )
        
        /// Static white for elements that must remain white (like text on images or accented buttons)
        static let white = Color.white
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
        // Read directly from UserDefaults since this is a static context
        static var isDyslexicFontEnabled: Bool {
            UserDefaults.standard.bool(forKey: "dyslexicFontEnabled")
        }
        
        static var fontScale: Double {
            let scale = UserDefaults.standard.double(forKey: "fontSizeScale")
            return scale > 0 ? scale : 1.0
        }
        
        private static func scaledSize(_ size: CGFloat) -> CGFloat {
            size * CGFloat(fontScale)
        }
        
        static func title() -> Font {
            let size = scaledSize(48)
            return isDyslexicFontEnabled 
                ? .system(size: size, weight: .bold, design: .rounded)
                : .custom("Georgia", size: size, relativeTo: .largeTitle)
        }
        
        static func heading() -> Font {
            let size = scaledSize(36)
            return isDyslexicFontEnabled
                ? .system(size: size, weight: .semibold, design: .rounded)
                : .system(size: size, weight: .regular, design: .serif)
        }
        
        static func subheading() -> Font {
            let size = scaledSize(28)
            return .system(size: size, weight: .semibold, design: isDyslexicFontEnabled ? .rounded : .default)
        }
        
        static func body() -> Font {
            let size = scaledSize(17)
            return isDyslexicFontEnabled
                ? .system(size: size, weight: .regular, design: .rounded)
                : .custom("Georgia", size: size, relativeTo: .body)
        }
        
        static func caption() -> Font {
            let size = scaledSize(15)
            // System font is usually fine, but let's respect the scaling
            return .system(size: size, weight: .regular)
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
