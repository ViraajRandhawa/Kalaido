//
//  ChooseMomentView.swift
//  Kalaido
//
//  Story selection screen with cultural moment cards
//

import SwiftUI

/// Screen where users choose a cultural story to read
struct ChooseMomentView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator
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
                            VStack(alignment: .leading, spacing: 0) { // Keep VStack for the static header parts
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
                                
                                // Categorized Stories
                                LazyVStack(alignment: .leading, spacing: 0, pinnedViews: [.sectionHeaders]) {
                                    ForEach(StoryData.cultures) { culture in
                                        Section(header: CultureSectionHeader(culture: culture)) {
                                            ForEach(culture.stories) { story in
                                                MomentCard(story: story)
                                                    .padding(.horizontal, 24)
                                                    .padding(.bottom, 16)
                                            }
                                            .padding(.top, 8)
                                        }
                                    }
                                }
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
        ChooseMomentView()
    }
    .environmentObject(NavigationCoordinator())
    .environmentObject(ReflectionManager())
}

/// Header view for culture sections
struct CultureSectionHeader: View {
    let culture: Culture
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(culture.name)
                .font(.system(size: 24, weight: .semibold, design: .serif))
                .foregroundColor(KalaidoTheme.Colors.textPrimary)
            
            Text(culture.description)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(KalaidoTheme.Colors.textSecondary)
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
        .background(KalaidoTheme.Colors.backgroundPrimary) // Opaque background for sticky header
        .accessibilityAddTraits(.isHeader)
    }
}
