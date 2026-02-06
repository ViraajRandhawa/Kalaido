//
//  OnboardingView.swift
//  Kalaido
//
//  Gentle introduction to the app
//

import SwiftUI

/// Onboarding flow with 3 introduction screens
struct OnboardingView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator
    @State private var currentPage = 0
    
    private let pages: [(icon: String, title: String, description: String)] = [
        (
            icon: "globe.asia.australia.fill",
            title: "Discover Cultural Moments",
            description: "Step into the lives of people from different cultures around the world through beautifully crafted stories."
        ),
        (
            icon: "heart.text.square.fill",
            title: "Reflect & Connect",
            description: "After each story, take a moment to reflect on how it made you feel. Build empathy through understanding."
        ),
        (
            icon: "book.closed.fill",
            title: "Keep a Journal",
            description: "Your reflections are saved privately in your journal. Look back on your journey anytime."
        )
    ]
    
    var body: some View {
        if #available(iOS 17.0, *) {
            content
                .sensoryFeedback(.selection, trigger: currentPage)
        } else {
            content
                .onChange(of: currentPage) { _ in
                    let generator = UIImpactFeedbackGenerator(style: .light)
                    generator.impactOccurred()
                }
        }
    }
    
    private var content: some View {
        ZStack {
            KalaidoTheme.backgroundGradient
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                
                // Page content
                TabView(selection: $currentPage) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        onboardingPage(pages[index])
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.easeInOut, value: currentPage)
                
                // Page indicator
                HStack(spacing: 8) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        Circle()
                            .fill(index == currentPage ? KalaidoTheme.Colors.accent : KalaidoTheme.Colors.progressTrack)
                            .frame(width: 8, height: 8)
                            .animation(.easeInOut, value: currentPage)
                    }
                }
                .padding(.bottom, 32)
                .accessibilityLabel("Page \(currentPage + 1) of \(pages.count)")
                
                // Continue/Get Started button
                Button(action: {
                    if currentPage < pages.count - 1 {
                        withAnimation {
                            currentPage += 1
                        }
                    } else {
                        coordinator.push(.chooseMoment)
                    }
                }) {
                    Text(currentPage < pages.count - 1 ? "Continue" : "Get Started")
                        .font(KalaidoTheme.Fonts.body().weight(.medium))
                        .foregroundColor(.white)
                        .frame(maxWidth: 280)
                        .padding(.vertical, 16)
                        .background(KalaidoTheme.Colors.accent)
                        .cornerRadius(KalaidoTheme.CornerRadius.pill)
                }
                .shadow(
                    color: KalaidoTheme.Shadows.button.color,
                    radius: KalaidoTheme.Shadows.button.radius,
                    x: KalaidoTheme.Shadows.button.x,
                    y: KalaidoTheme.Shadows.button.y
                )
                .accessibilityLabel(currentPage < pages.count - 1 ? "Continue to next page" : "Get started with Kalaido")
                
                // Skip button (not on last page)
                if currentPage < pages.count - 1 {
                    Button("Skip") {
                        coordinator.push(.chooseMoment)
                    }
                    .font(KalaidoTheme.Fonts.caption())
                    .foregroundColor(KalaidoTheme.Colors.textSecondary)
                    .padding(.top, 16)
                    .accessibilityLabel("Skip onboarding")
                }
                
                Spacer()
                    .frame(height: 60)
            }
        }
    }

    // MARK: - Onboarding Page
    
    private func onboardingPage(_ page: (icon: String, title: String, description: String)) -> some View {
        VStack(spacing: 24) {
            Spacer()
            
            // Icon
            Image(systemName: page.icon)
                .font(.system(size: 80))
                .foregroundColor(KalaidoTheme.Colors.accent)
                .accessibilityHidden(true)
            
            Spacer()
                .frame(height: 32)
            
            // Title
            Text(page.title)
                .font(KalaidoTheme.Fonts.subheading())
                .foregroundColor(KalaidoTheme.Colors.textPrimary)
                .multilineTextAlignment(.center)
                .accessibilityAddTraits(.isHeader)
            
            // Description
            Text(page.description)
                .font(KalaidoTheme.Fonts.body())
                .foregroundColor(KalaidoTheme.Colors.textSecondary)
                .multilineTextAlignment(.center)
                .lineSpacing(6)
                .padding(.horizontal, 40)
            
            Spacer()
        }
    }
}

// MARK: - Preview

#Preview {
    OnboardingView()
}
