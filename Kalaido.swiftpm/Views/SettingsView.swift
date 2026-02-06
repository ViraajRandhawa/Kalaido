//
//  SettingsView.swift
//  Kalaido
//
//  Created by Viraaj Randhawa on 22/01/26.
//

import SwiftUI

/// Settings, preferences, and accessibility controls
struct SettingsView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    // User Preferences
    @AppStorage("hapticsEnabled") private var hapticsEnabled = true
    @AppStorage("highContrastEnabled") private var highContrastEnabled = false
    @AppStorage("reduceMotionEnabled") private var reduceMotionEnabled = false
    
    // Onboarding State
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    
    // Alert State
    @State private var showResetConfirmation = false
    
    var body: some View {
        ZStack {
            KalaidoTheme.backgroundGradient
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                // Header
                Text("Settings")
                    .font(.system(size: 36, weight: .regular, design: .serif))
                    .foregroundColor(KalaidoTheme.Colors.textPrimary)
                    .padding(.horizontal, 24)
                    .padding(.top, 20)
                    .padding(.bottom, 24)
                    .accessibilityAddTraits(.isHeader)
                
                List {
                    // Accessibility Section
                    Section(header: Text("Accessibility").foregroundColor(KalaidoTheme.Colors.textSecondary)) {
                        Toggle("High Contrast", isOn: $highContrastEnabled)
                            .toggleStyle(SwitchToggleStyle(tint: KalaidoTheme.Colors.accent))
                            .accessibilityHint("Increases contrast for better readability")
                        
                        Toggle("Reduce Motion", isOn: $reduceMotionEnabled)
                            .toggleStyle(SwitchToggleStyle(tint: KalaidoTheme.Colors.accent))
                            .accessibilityHint("Reduces animations throughout the app")
                    }
                    .listRowBackground(KalaidoTheme.Colors.cardBackground.opacity(0.8))
                    
                    // Preferences Section
                    Section(header: Text("Preferences").foregroundColor(KalaidoTheme.Colors.textSecondary)) {
                        Toggle("Haptic Feedback", isOn: $hapticsEnabled)
                            .toggleStyle(SwitchToggleStyle(tint: KalaidoTheme.Colors.accent))
                            .accessibilityHint("Enables vibration feedback")
                    }
                    .listRowBackground(KalaidoTheme.Colors.cardBackground.opacity(0.8))
                    
                    // Data & Privacy Section
                    Section(header: Text("Data & Storage").foregroundColor(KalaidoTheme.Colors.textSecondary)) {
                        Button(action: {
                            showResetConfirmation = true
                        }) {
                            Text("Reset Onboarding")
                                .foregroundColor(.red)
                        }
                        .alert("Reset Onboarding?", isPresented: $showResetConfirmation) {
                            Button("Cancel", role: .cancel) { }
                            Button("Reset", role: .destructive) {
                                hasSeenOnboarding = false
                                // Optional: Automatically pop to welcome or just let user navigate?
                                // Let's just confirm it's done.
                            }
                        } message: {
                            Text("This will make the introduction screens appear again next time you launch the app.")
                        }
                    }
                    .listRowBackground(KalaidoTheme.Colors.cardBackground.opacity(0.8))
                    
                    // About Section
                    Section(header: Text("About").foregroundColor(KalaidoTheme.Colors.textSecondary)) {
                        HStack {
                            Text("Version")
                            Spacer()
                            Text("1.0.0")
                                .foregroundColor(KalaidoTheme.Colors.textSecondary)
                        }
                        
                        HStack {
                            Text("Challenge")
                            Spacer()
                            Text("Swift Student Challenge 2026")
                                .foregroundColor(KalaidoTheme.Colors.textSecondary)
                        }
                    }
                    .listRowBackground(KalaidoTheme.Colors.cardBackground.opacity(0.8))
                }
                .scrollContentBackground(.hidden) // Remove default list gray background
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SettingsView()
        .environmentObject(NavigationCoordinator())
}
