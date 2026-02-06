//
//  StoryReaderView.swift
//  Kalaido
//
//  Story reading experience with page navigation
//

import SwiftUI

/// Full-screen story reading experience with swipe navigation
struct StoryReaderView: View {
    let story: Story
    @State private var currentPage = 0
    @State private var showReflection = false
    @State private var dragOffset: CGFloat = 0
    @EnvironmentObject var coordinator: NavigationCoordinator
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        if #available(iOS 17.0, *) {
            GeometryReader { geometry in
                ZStack {
                    // Background gradient
                    KalaidoTheme.backgroundGradient
                        .ignoresSafeArea()
                    
                    VStack {
                        Spacer()
                        
                        // Story card
                        VStack(spacing: 0) {
                            // Header with gradient
                            ZStack(alignment: .topLeading) {
                                KalaidoTheme.horizontalGradient(story.colors)
                                    .frame(height: 120)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(story.title)
                                        .font(.system(size: 28, weight: .semibold))
                                        .foregroundColor(.white)
                                        .lineLimit(2)
                                        .minimumScaleFactor(0.8)
                                        .accessibilityAddTraits(.isHeader)
                                    
                                    Text(story.country)
                                        .font(.system(size: 18, weight: .regular))
                                        .foregroundColor(.white.opacity(0.9))
                                }
                                .padding(.horizontal, 32)
                                .padding(.top, 32)
                                .padding(.trailing, 16)
                            }
                            
                            // Image section
                            if let imageName = story.image(at: currentPage) {
                                Image(systemName: imageName)
                                    .font(.system(size: 80))
                                    .foregroundColor(KalaidoTheme.Colors.iconMuted)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 180)
                                    .background(KalaidoTheme.Colors.imageBackground)
                                    .accessibilityHidden(true)
                            }
                            
                            // Story content
                            VStack(spacing: 24) {
                                Text(story.paragraph(at: currentPage))
                                    .font(.custom("Georgia", size: 17, relativeTo: .body))
                                    .foregroundColor(Color(red: 0.15, green: 0.15, blue: 0.15))
                                    .lineSpacing(10)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .frame(height: 120)
                                    .padding(.horizontal, 32)
                                    .padding(.top, 32)
                                    .accessibilityLabel("Page \(currentPage + 1) of \(story.pageCount). \(story.paragraph(at: currentPage))")
                                
                                // Navigation controls with progress bar
                                navigationControls
                                    .padding(.bottom, 32)
                                    .padding(.horizontal, 32)
                            }
                            .background(KalaidoTheme.Colors.cardBackground)
                        }
                        .frame(maxWidth: min(geometry.size.width - 48, 500))
                        .cornerRadius(KalaidoTheme.CornerRadius.large)
                        .shadow(
                            color: KalaidoTheme.Shadows.elevatedCard.color,
                            radius: KalaidoTheme.Shadows.elevatedCard.radius,
                            x: KalaidoTheme.Shadows.elevatedCard.x,
                            y: KalaidoTheme.Shadows.elevatedCard.y
                        )
                        .offset(x: dragOffset)
                        .gesture(swipeGesture)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            // Page turn haptics (iOS 17+)
            .sensoryFeedback(.selection, trigger: currentPage)
        } else {
            // Fallback on earlier versions
        }
    }
    
    // MARK: - Navigation Controls
    
    private var navigationControls: some View {
        HStack(spacing: 16) {
            // Previous button
            Button(action: goToPreviousPage) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(currentPage > 0 ? KalaidoTheme.Colors.textSecondary : KalaidoTheme.Colors.iconMuted)
                    .frame(width: 44, height: 44)
                    .background(KalaidoTheme.Colors.cardBackground)
                    .cornerRadius(22)
            }
            .disabled(currentPage == 0)
            .accessibilityLabel("Previous page")
            .accessibilityHint(currentPage > 0 ? "Go to page \(currentPage)" : "You are on the first page")
            
            // Progress bar
            progressBar
            
            // Next button
            Button(action: goToNextPage) {
                Image(systemName: "chevron.right")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
                    .background(
                        KalaidoTheme.horizontalGradient(story.colors)
                    )
                    .cornerRadius(22)
            }
            .accessibilityLabel(currentPage < story.pageCount - 1 ? "Next page" : "Complete story")
            .accessibilityHint(currentPage < story.pageCount - 1 ? "Go to page \(currentPage + 2)" : "Proceed to reflection")
        }
    }
    
    private var progressBar: some View {
        ZStack(alignment: .leading) {
            // Background track
            RoundedRectangle(cornerRadius: 4)
                .fill(KalaidoTheme.Colors.progressTrack)
                .frame(height: 6)
            
            // Progress fill
            GeometryReader { geo in
                RoundedRectangle(cornerRadius: 4)
                    .fill(KalaidoTheme.horizontalGradient(story.colors))
                    .frame(width: geo.size.width * CGFloat(currentPage + 1) / CGFloat(story.pageCount), height: 6)
                    .animation(.easeInOut(duration: 0.3), value: currentPage)
            }
        }
        .frame(height: 6)
        .accessibilityLabel("Reading progress: page \(currentPage + 1) of \(story.pageCount)")
    }
    
    // MARK: - Swipe Gesture
    
    private var swipeGesture: some Gesture {
        DragGesture()
            .onChanged { gesture in
                dragOffset = gesture.translation.width
            }
            .onEnded { gesture in
                let swipeThreshold: CGFloat = 50
                
                if gesture.translation.width < -swipeThreshold {
                    // Swipe left - go to next page
                    if currentPage < story.pageCount - 1 {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                            currentPage += 1
                            dragOffset = 0
                        }
                    } else {
                        // Last page - show reflection
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                            dragOffset = 0
                        }
                        coordinator.push(.reflection(story))
                    }
                } else if gesture.translation.width > swipeThreshold && currentPage > 0 {
                    // Swipe right - go to previous page
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                        currentPage -= 1
                        dragOffset = 0
                    }
                } else {
                    // Snap back to original position
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                        dragOffset = 0
                    }
                }
            }
    }
    
    // MARK: - Navigation Actions
    
    private func goToPreviousPage() {
        if currentPage > 0 {
            withAnimation {
                currentPage -= 1
            }
        }
    }
    
    private func goToNextPage() {
        if currentPage < story.pageCount - 1 {
            withAnimation {
                currentPage += 1
            }
        } else {
            coordinator.push(.reflection(story))
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        StoryReaderView(story: StoryData.celebrationStory)
    }
    .environmentObject(NavigationCoordinator())
}
