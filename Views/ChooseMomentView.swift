//
//  ChooseMomentView.swift
//  Kalaido
//
//  Story selection screen with cultural moment cards
//

import SwiftUI

/// Screen where users choose a cultural story to read
struct ChooseMomentView: View {
    @Binding var navigationPath: NavigationPath
    @State private var showSidebar = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Main Content
            VStack(spacing: 0) {
                // Background
                KalaidoTheme.backgroundGradient
                    .ignoresSafeArea()
                    .overlay {
                        ScrollView {
                            VStack(alignment: .leading, spacing: 0) {
                                // Header
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Choose a Moment")
                                        .font(.system(size: 36, weight: .regular, design: .serif))
                                        .foregroundColor(KalaidoTheme.Colors.textPrimary)
                                        .accessibilityAddTraits(.isHeader)
                                    
                                    Text("Each experience opens a window into someone's life")
                                        .font(.system(size: 16, weight: .regular))
                                        .foregroundColor(KalaidoTheme.Colors.textTertiary)
                                }
                                .padding(.horizontal, 24)
                                .padding(.top, 20)
                                .padding(.bottom, 32)
                                
                                // Moment cards - using extracted StoryData
                                VStack(spacing: 16) {
                                    ForEach(StoryData.allStories, id: \.title) { story in
                                        MomentCard(story: story)
                                    }
                                }
                                .padding(.horizontal, 24)
                                .padding(.bottom, 32)
                            }
                        }
                    }
            }
            .offset(x: showSidebar ? 280 : 0)
            .disabled(showSidebar)
            .animation(.spring(response: 0.4, dampingFraction: 0.8), value: showSidebar)
            
            // Sidebar Overlay
            if showSidebar {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture { showSidebar = false }
                    .transition(.opacity)
                    .accessibilityLabel("Close sidebar")
                    .accessibilityAddTraits(.isButton)
                
                SidebarView(isOpen: $showSidebar)
                    .transition(.move(edge: .leading))
                    .zIndex(2)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { showSidebar.toggle() }) {
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(KalaidoTheme.Colors.textSecondary)
                }
                .accessibilityLabel("Open menu")
                .accessibilityHint("Opens the navigation sidebar")
            }
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        ChooseMomentView(navigationPath: .constant(NavigationPath()))
    }
    .environmentObject(ReflectionManager())
}
