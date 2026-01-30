//
//  WelcomeView.swift
//  Kalaido
//
//  Main welcome screen with app branding
//

import SwiftUI

/// The main welcome/landing screen of the app
struct WelcomeView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator
    @StateObject private var reflectionManager = ReflectionManager()
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @State private var showOnboarding = false
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ZStack {
                // Background gradient
                KalaidoTheme.backgroundGradient
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Spacer()
                    
                    // Logo
                    Image("logo")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: 10)
                        .accessibilityHidden(true)
                    
                    Spacer()
                        .frame(height: 60)
                    
                    // Title
                    Text("Kalaido")
                        .font(.system(size: 48, weight: .regular, design: .serif))
                        .foregroundColor(KalaidoTheme.Colors.textPrimary)
                        .accessibilityAddTraits(.isHeader)
                    
                    Spacer()
                        .frame(height: 24)
                    
                    // Taglines
                    VStack(spacing: 8) {
                        Text("Step into moments")
                        Text("from lives around the world")
                        Text("One story at a time")
                    }
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(KalaidoTheme.Colors.textSecondary)
                    .multilineTextAlignment(.center)
                    
                    Spacer()
                        .frame(height: 40)
                    
                    // Begin button
                    Button(action: {
                        coordinator.push(.chooseMoment)
                    }) {
                        Text("Begin")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white)
                            .frame(minWidth: 140, maxWidth: 200)
                            .frame(height: 50)
                            .background(KalaidoTheme.Colors.accent)
                            .cornerRadius(KalaidoTheme.CornerRadius.pill)
                    }
                    .shadow(
                        color: KalaidoTheme.Shadows.button.color,
                        radius: KalaidoTheme.Shadows.button.radius,
                        x: KalaidoTheme.Shadows.button.x,
                        y: KalaidoTheme.Shadows.button.y
                    )
                    .accessibilityLabel("Begin")
                    .accessibilityHint("Start exploring cultural stories")
                    
                    Spacer()
                }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .chooseMoment:
                    ChooseMomentView()
                case .storyReader(let story):
                    StoryReaderView(story: story)
                case .reflection(let story):
                    ReflectionView(story: story)
                }
            }
        }
        .environmentObject(reflectionManager)
        .fullScreenCover(isPresented: $showOnboarding) {
            OnboardingView(showOnboarding: $showOnboarding)
        }
        .onAppear {
            if !hasSeenOnboarding {
                showOnboarding = true
                hasSeenOnboarding = true
            }
        }
    }
}

// MARK: - Navigation Destinations (Removed in favor of Route enum in NavigationCoordinator.swift)

// MARK: - Preview

#Preview {
    WelcomeView()
}
