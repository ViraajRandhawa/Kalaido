//
//  MomentCard.swift
//  Kalaido
//
//  Card component for displaying a story preview
//

import SwiftUI

/// A card that displays a cultural story preview
struct MomentCard: View {
    let story: Story
    @EnvironmentObject var coordinator: NavigationCoordinator
    @EnvironmentObject var manager: ReflectionManager
    
    /// Whether this story has been completed
    private var isCompleted: Bool {
        manager.isStoryCompleted(story)
    }
    
    var body: some View {
        Button(action: {
            coordinator.push(.storyReader(story))
        }) {
            HStack(spacing: 16) {
                Image(systemName: story.icon)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .frame(width: 28)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(story.title)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                    
                    HStack(spacing: 8) {
                        Text(story.country)
                        Text("•")
                        Text(story.readingTimeText)
                    }
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(.white.opacity(0.9))
                }
                
                Spacer()
                
                // Completed badge
                if isCompleted {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 22))
                        .foregroundColor(.white.opacity(0.9))
                        .accessibilityLabel("Completed")
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 24)
            .background(
                KalaidoTheme.horizontalGradient(story.colors)
            )
            .cornerRadius(KalaidoTheme.CornerRadius.medium)
            .shadow(
                color: KalaidoTheme.Shadows.card.color,
                radius: KalaidoTheme.Shadows.card.radius,
                x: KalaidoTheme.Shadows.card.x,
                y: KalaidoTheme.Shadows.card.y
            )
        }
        // MARK: - Accessibility
        .accessibilityLabel("\(story.title) from \(story.country)\(isCompleted ? ", completed" : "")")
        .accessibilityHint(isCompleted ? "Double tap to read again" : "Double tap to read this cultural story")
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        VStack {
            MomentCard(story: StoryData.celebrationStory)
            MomentCard(story: StoryData.respectStory)
        }
        .padding()
    }
    .environmentObject(ReflectionManager())
}
