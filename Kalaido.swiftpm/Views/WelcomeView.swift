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
                        .frame(width: 200, height: 200)
                        .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: 10)
                        .accessibilityHidden(true)
                    
                    Spacer()
                        .frame(height: 60)
                    
                    // Title
                    Text("Kalaido")
                        .font(KalaidoTheme.Fonts.title())
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
                    .font(KalaidoTheme.Fonts.body())
                    .foregroundColor(KalaidoTheme.Colors.textSecondary)
                    .multilineTextAlignment(.center)
                    
                    Spacer()
                        .frame(height: 40)
                    
                    // Begin button
                    Button(action: {
                        coordinator.push(.onboarding)
                    }) {
                        Text("Begin")
                            .font(KalaidoTheme.Fonts.body().weight(.medium))
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
                case .onboarding:
                    OnboardingView()
                case .chooseMoment:
                    ChooseMomentView()
                case .storyReader(let story, let culture):
                    StoryReaderView(story: story, culture: culture)
                case .reflection(let story):
                    ReflectionView(story: story)
                case .settings:
                    SettingsView()
                }
            }
        }
        .environmentObject(reflectionManager)
        .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("OpenSettings"))) { _ in
            coordinator.push(.settings)
        }
    }
}

// MARK: - Preview

#Preview {
    WelcomeView()
        .environmentObject(NavigationCoordinator())
}
