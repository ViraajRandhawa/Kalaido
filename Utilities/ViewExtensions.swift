//
//  ViewExtensions.swift
//  Kalaido
//
//  Helper extensions for SwiftUI views
//

import SwiftUI
import UIKit

// MARK: - Corner Radius Extension

extension View {
    /// Apply corner radius to specific corners only
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

/// Custom shape for selective corner rounding
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

// MARK: - Accessibility Helpers

extension View {
    /// Add accessibility label and hint for interactive elements
    func accessibleButton(label: String, hint: String? = nil) -> some View {
        self
            .accessibilityLabel(label)
            .accessibilityHint(hint ?? "")
            .accessibilityAddTraits(.isButton)
    }
    
    /// Add accessibility traits for headers
    func accessibleHeader() -> some View {
        self.accessibilityAddTraits(.isHeader)
    }
}
